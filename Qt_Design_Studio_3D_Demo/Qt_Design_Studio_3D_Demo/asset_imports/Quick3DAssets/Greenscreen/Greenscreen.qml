import QtQuick
import QtQuick3D

Node {
    id: node

    // Resources
    PrincipledMaterial {
        id: material_material
        baseColor: "#ff005108"
        roughness: 1
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Node {
        id: sketchfab_model
        rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
        scale.x: 0.29268
        scale.y: 0.29268
        scale.z: 0.29268
        Node {
            id: node5181eb68339f44e7a915e54cda740543_obj_cleaner_materialmerger_gles
            Model {
                id: object_2
                source: "meshes/object_0.mesh"
                materials: material_material
            }
        }
    }

    // Animations:
}
