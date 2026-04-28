import QtQuick 2.0

Item {
    Column {

        Text {
            text: "ZotixOS Filesystem Check"
        }

        Text {
            color: "orange"
            text: "⚠ Snapshots and system rollback will be disabled on this filesystem."
            visible: globalStorage.value("fs") !== "btrfs"
        }
    }
}
