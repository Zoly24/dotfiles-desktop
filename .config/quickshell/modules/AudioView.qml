import Quickshell
import QtQuick
import QtQuick.Layouts
import "../components/"
import "../core/"

ColumnLayout {
    id: column
    property bool audioMuted;
    property BarConfig config;

    anchors.fill: parent
    spacing: 0

    // Audio Sink Information
    Rectangle {
        id: mainAudioSinkContainer
        anchors.top: parent.top
        width: column.config.audioMenuWidth - (column.config.audioViewMargin * 2)
        height: column.config.audioItemHeight
        color: "transparent"

        Rectangle {
            id: mainAudioSinkDropdown
            anchors.verticalCenter: parent.verticalCenter
            width: 400
            height: column.config.audioItemHeight
            radius: Math.min(mainAudioSinkDropdown.height, mainAudioSinkDropdown.width) / 2
            color: Colorscheme.bgAccent
            Text {
                id: mainAudioSinkText
                // Text eliding
                width: parent.width - (column.config.audioViewTextMargin * 2)
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignLeft
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: column.config.audioViewTextMargin

                text: AudioService.currentSinkName
                color: "white"
            }
        }

        ButtonModule {
            id: mainAudioSinkMuteButton
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: mainAudioSinkContainer.right
            buttonHeight: mainAudioSinkDropdown.height
            buttonWidth: buttonHeight
            icon: AudioService.isSinkMuted ? "󰝟" : "󰕾"
            onClicked: {
                AudioService.toggleAudioSinkMute()
            }
        }
    }

    SliderComponent {
        id: mainAudioSinkSlider
        Layout.alignment: Qt.AlignCenter
        anchors.top: mainAudioSinkContainer.bottom
        sliderHeight: column.config.audioItemHeight
        anchors.margins: column.config.audioItemMargin
        sliderWidth: column.config.audioMenuWidth - (column.config.audioViewMargin * 2)
        hidden: AudioService.isSinkMuted
        percentFilled: AudioService.currentSinkVolume
        onUpdated: (newVolume) => {
            AudioService.setSinkVolume(newVolume)
            if (AudioService.isSinkMuted && newVolume > 0) {
                AudioService.setAudioSinkMute(false)
            }
        }

        Text {
            id: mainAudioSinkVolumePercent
            anchors.verticalCenter: mainAudioSinkSlider.verticalCenter
            anchors.right: mainAudioSinkSlider.right
            anchors.margins: 15
            color: Colorscheme.primaryAccent
            text: AudioService.isSinkMuted ? "Muted" : Math.round(AudioService.getSinkVolume() * 100) + "%"
        }
    }




    // Audio Source Information
    Rectangle {
        id: mainAudioSourceContainer
        anchors.top: mainAudioSinkSlider.bottom
        width: column.config.audioMenuWidth - (column.config.audioViewMargin * 2)
        height: column.config.audioItemHeight
        anchors.margins: column.config.audioItemMargin
        color: "transparent"

        Rectangle {
            id: mainAudioSourceDropdown
            anchors.verticalCenter: parent.verticalCenter
            width: 400
            height: column.config.audioItemHeight
            radius: Math.min(mainAudioSourceDropdown.height, mainAudioSourceDropdown.width) / 2
            color: Colorscheme.bgAccent
            Text {
                id: mainAudioSourceText
                // Text eliding
                width: parent.width - (column.config.audioViewTextMargin * 2)
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignLeft
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: column.config.audioViewTextMargin

                text: AudioService.currentSourceName
                color: "white"
            }
        }

        ButtonModule {
            id: mainAudioSourceMuteButton
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: mainAudioSourceContainer.right
            buttonHeight: mainAudioSourceDropdown.height
            buttonWidth: buttonHeight
            icon: AudioService.isSourceMuted ? "" : ""
            onClicked: {
                AudioService.toggleAudioSourceMute()
            }
        }
    }

    SliderComponent {
        id: mainAudioSourceSlider
        Layout.alignment: Qt.AlignCenter
        anchors.top: mainAudioSourceContainer.bottom
        sliderHeight: column.config.audioItemHeight
        anchors.margins: column.config.audioItemMargin
        sliderWidth: column.config.audioMenuWidth - (column.config.audioViewMargin * 2)
        hidden: AudioService.isSourceMuted
        percentFilled: AudioService.currentSourceVolume
        onUpdated: (newVolume) => {
            AudioService.setSourceVolume(newVolume)
            if (AudioService.isSourceMuted && newVolume > 0) {
                AudioService.setAudioSourceMute(false)
            }
        }

        Text {
            id: mainAudioSourceVolumePercent
            anchors.verticalCenter: mainAudioSourceSlider.verticalCenter
            anchors.right: mainAudioSourceSlider.right
            anchors.margins: 15
            color: Colorscheme.primaryAccent
            text: AudioService.isSourceMuted ? "Muted" : Math.round(AudioService.getSourceVolume() * 100) + "%"
        }
    }
}


