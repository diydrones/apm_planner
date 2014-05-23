//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.

//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.

//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//    (c) 2014 Author: Bill Bonney <billbonney@communistech.com>
//
import QtQuick 1.1

Rectangle {
    id: root

    property string message

    anchors.fill: parent

    border.color: "red"
    border.width: 20

    color: "Transparent"

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -50
        anchors.horizontalCenter: parent.horizontalCenter
        color: "red"
        style: Text.Outline
        styleColor: "black"
        text: message
        smooth: true
        font.pointSize: 28
    }

    SequentialAnimation on border.color {
        id: animator
        running: true
        loops: Animation.Infinite
        ColorAnimation {id:toRed; to: "red"; duration: 1000 }
        ColorAnimation {id:toTransparent; to: "transparent"; duration: 1000 }
    }
}
