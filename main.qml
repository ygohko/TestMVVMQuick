/*
 * Copyright (c) 2022 Yasuaki Gohko
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE ABOVE LISTED COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2
import QtQml 2.2

Window {
    width: 320
    height: 150
    visible: true
    title: qsTr("TestMVVMQuick")

    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            id: gridLayout
            rows: 2
            columns: 2

            Label {
                id: label
                text: qsTr("Price")
            }

            TextField {
                id: priceTextField
                Layout.fillWidth: true
                placeholderText: qsTr("Input price here")
                text: viewModel.price
                Binding {
                    target: viewModel
                    property: "price"
                    value: priceTextField.text
                }
            }

            Label {
                id: label1
                text: qsTr("Total")
            }

            TextField {
                id: totalTextField
                Layout.fillWidth: true
                text: viewModel.total
            }
        }

        Button {
            id: button
            text: qsTr("Calculate")
            Layout.fillWidth: true
            onClicked: {
                viewModel.calculate()
            }
        }
    }
}
