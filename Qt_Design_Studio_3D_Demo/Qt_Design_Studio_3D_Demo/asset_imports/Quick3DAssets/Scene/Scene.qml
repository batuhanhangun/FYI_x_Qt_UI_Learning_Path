import QtQuick
import QtQuick3D

Node {
    id: node

    // Resources
    Texture {
        id: textures_Arms_mat_baseColor_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Arms_mat_baseColor.png"
    }
    Texture {
        id: textures_Arms_mat_metallicRoughness_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Arms_mat_metallicRoughness.png"
    }
    Texture {
        id: textures_Arms_mat_normal_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Arms_mat_normal.png"
    }
    Texture {
        id: textures_Acessories_mat_baseColor_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Acessories_mat_baseColor.png"
    }
    Texture {
        id: textures_Acessories_mat_metallicRoughness_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Acessories_mat_metallicRoughness.png"
    }
    Texture {
        id: textures_Acessories_mat_normal_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Acessories_mat_normal.png"
    }
    Texture {
        id: textures_Legs_mat_baseColor_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Legs_mat_baseColor.png"
    }
    Texture {
        id: textures_Legs_mat_metallicRoughness_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Legs_mat_metallicRoughness.png"
    }
    Texture {
        id: textures_Legs_mat_normal_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Legs_mat_normal.png"
    }
    Texture {
        id: textures_Main_mat_baseColor_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Main_mat_baseColor.png"
    }
    Texture {
        id: textures_Main_mat_metallicRoughness_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Main_mat_metallicRoughness.png"
    }
    Texture {
        id: textures_Main_mat_normal_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Main_mat_normal.png"
    }
    Texture {
        id: textures_Eye_mat_baseColor_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Eye_mat_baseColor.png"
    }
    Texture {
        id: textures_Eye_mat_metallicRoughness_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Eye_mat_metallicRoughness.png"
    }
    Texture {
        id: textures_Eye_mat_normal_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Eye_mat_normal.png"
    }
    Texture {
        id: textures_Face_mat_baseColor_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Face_mat_baseColor.png"
    }
    Texture {
        id: textures_Face_mat_metallicRoughness_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Face_mat_metallicRoughness.png"
    }
    Texture {
        id: textures_Face_mat_normal_png_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/Face_mat_normal.png"
    }
    PrincipledMaterial {
        id: arms_mat_material
        baseColorMap: textures_Arms_mat_baseColor_png_texture
        metalnessMap: textures_Arms_mat_metallicRoughness_png_texture
        roughnessMap: textures_Arms_mat_metallicRoughness_png_texture
        metalness: 1
        roughness: 1
        normalMap: textures_Arms_mat_normal_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: acessories_mat_material
        baseColorMap: textures_Acessories_mat_baseColor_png_texture
        metalnessMap: textures_Acessories_mat_metallicRoughness_png_texture
        roughnessMap: textures_Acessories_mat_metallicRoughness_png_texture
        metalness: 1
        roughness: 1
        normalMap: textures_Acessories_mat_normal_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: legs_mat_material
        baseColorMap: textures_Legs_mat_baseColor_png_texture
        metalnessMap: textures_Legs_mat_metallicRoughness_png_texture
        roughnessMap: textures_Legs_mat_metallicRoughness_png_texture
        metalness: 1
        roughness: 1
        normalMap: textures_Legs_mat_normal_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: main_mat_material
        baseColorMap: textures_Main_mat_baseColor_png_texture
        metalnessMap: textures_Main_mat_metallicRoughness_png_texture
        roughnessMap: textures_Main_mat_metallicRoughness_png_texture
        metalness: 1
        roughness: 1
        normalMap: textures_Main_mat_normal_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: eye_mat_material
        baseColorMap: textures_Eye_mat_baseColor_png_texture
        metalnessMap: textures_Eye_mat_metallicRoughness_png_texture
        roughnessMap: textures_Eye_mat_metallicRoughness_png_texture
        roughness: 1
        normalMap: textures_Eye_mat_normal_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: face_mat_material
        baseColorMap: textures_Face_mat_baseColor_png_texture
        metalnessMap: textures_Face_mat_metallicRoughness_png_texture
        roughnessMap: textures_Face_mat_metallicRoughness_png_texture
        metalness: 1
        roughness: 1
        normalMap: textures_Face_mat_normal_png_texture
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Node {
        id: sketchfab_model
        rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
        Node {
            id: node2abe46300d6b4403a8f1bcb6395d82e4_fbx
            rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
            scale.x: 0.01
            scale.y: 0.01
            scale.z: 0.01
            Node {
                id: rootNode
                Node {
                    id: paladin
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale.x: 100
                    scale.y: 100
                    scale.z: 100
                    Model {
                        id: paladin_Arms_mat_0
                        source: "meshes/paladin_Arms_mat_0.mesh"
                        materials: arms_mat_material
                    }
                    Model {
                        id: paladin_Acessories_mat_0
                        source: "meshes/paladin_Acessories_mat_0.mesh"
                        materials: acessories_mat_material
                    }
                    Model {
                        id: paladin_Legs_mat_0
                        source: "meshes/paladin_Legs_mat_0.mesh"
                        materials: legs_mat_material
                    }
                    Model {
                        id: paladin_Main_mat_0
                        source: "meshes/paladin_Main_mat_0.mesh"
                        materials: main_mat_material
                    }
                    Model {
                        id: paladin_Eye_mat_0
                        source: "meshes/paladin_Eye_mat_0.mesh"
                        materials: eye_mat_material
                    }
                    Model {
                        id: paladin_Face_mat_0
                        source: "meshes/paladin_Face_mat_0.mesh"
                        materials: face_mat_material
                    }
                }
            }
        }
    }

    // Animations:
}
