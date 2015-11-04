/**************************
***** Used Parameters *****
***************************
@P EffectName: ParadoxForwardShadingEffect
@P CompilerParameters.DebugKey: True
@P Material.HasSkinningTangent: False
@P LightSkyboxShader.LightDiffuseColor.environmentLights[0]: SphericalHarmonicsEnvironmentColor<3>
@P Lighting.EnvironmentLights: pdxfx LightSkyboxEffect
@P LightSkyboxShader.LightSpecularColor.environmentLights[0]: RoughnessCubeMapEnvironmentColor
@P Material.PixelStageStreamInitializer: mixin MaterialStream, MaterialPixelShadingStream
@P Material.HasNormalMap: True
@P Material.HasSkinningPosition: True
@P Material.HasSkinningNormal: True
@P ParadoxEffectBase.ExtensionPostVertexStageShader: null
@P Material.PixelStageSurfaceShaders: mixin MaterialSurfaceArray [{layers = [mixin MaterialSurfaceDiffuse [{diffuseMap = ComputeColorTextureScaledOffsetDynamicSampler<Material.DiffuseMap,TEXCOORD0,Material.Sampler.i0,rgba,Material.TextureScale,Material.TextureOffset>}], mixin MaterialSurfaceNormalMap<false,true> [{normalMap = ComputeColorTextureScaledOffsetDynamicSampler<Material.NormalMap,TEXCOORD0,Material.Sampler.i0,rgba,Material.TextureScale.i1,Material.TextureOffset.i1>}], mixin MaterialSurfaceSetStreamFromComputeColor<matSpecular,rgb> [{computeColorSource = ComputeColorConstantColorLink<Material.SpecularValue>}], mixin MaterialSurfaceSetStreamFromComputeColor<matSpecularIntensity,r> [{computeColorSource = ComputeColorConstantFloatLink<Material.SpecularIntensityValue>}], mixin MaterialSurfaceLightingAndShading [{surfaces = [MaterialSurfaceShadingDiffuseLambert<false>, mixin MaterialSurfaceShadingSpecularMicrofacet [{fresnelFunction = MaterialSpecularMicrofacetFresnelSchlick}, {geometricShadowingFunction = MaterialSpecularMicrofacetVisibilityImplicit}, {normalDistributionFunction = MaterialSpecularMicrofacetNormalDistributionBlinnPhong}]]}]]}]
@P Material.TessellationShader: null
@P Lighting.DirectLightGroups: mixin LightDirectionalGroup<8>, ShadowMapReceiverDirectional<4,8,false,true,false>, ShadowMapFilterPcf<5>
@P Material.SkinningBones: 16
@P CompilerParameters.GraphicsPlatformKey: Direct3D11
@P Material.PixelStageSurfaceFilter: null
@P Material.SkinningMaxBones: 56
@P CompilerParameters.GraphicsProfileKey: Level_10_0
@P Material.VertexStageSurfaceShaders: null
***************************
****  ConstantBuffers  ****
***************************
cbuffer PerFrame [Stage: Vertex, Size: 80]
@C    ViewProjection_id26 => Transformation.ViewProjection
@C    Eye_id28 => Transformation.Eye
cbuffer Globals [Stage: Vertex, Size: 3888]
@C    BlendMatrixArray_id37 => TransformationSkinning.BlendMatrixArray
@C    ShadowMapTextureSize_id86 => ShadowMap.TextureSize.directLightGroups[0]
@C    ShadowMapTextureTexelSize_id87 => ShadowMap.TextureTexelSize.directLightGroups[0]
@C    SphericalColors_id160 => SphericalHarmonicsEnvironmentColor.SphericalColors.lightDiffuseColor.environmentLights[0]
@C    MipCount_id162 => RoughnessCubeMapEnvironmentColor.MipCount.lightSpecularColor.environmentLights[0]
@C    SkyMatrix_id163 => LightSkyboxShader.SkyMatrix.environmentLights[0]
@C    Intensity_id164 => LightSkyboxShader.Intensity.environmentLights[0]
@C    scale_id170 => Material.TextureScale
@C    offset_id171 => Material.TextureOffset
@C    scale_id175 => Material.TextureScale.i1
@C    offset_id176 => Material.TextureOffset.i1
@C    constantColor_id183 => Material.SpecularValue
@C    constantFloat_id185 => Material.SpecularIntensityValue
cbuffer PerFrame [Stage: Pixel, Size: 80]
@C    ViewProjection_id26 => Transformation.ViewProjection
@C    Eye_id28 => Transformation.Eye
cbuffer PerObject [Stage: Pixel, Size: 320]
@C    World_id30 => Transformation.World
@C    LightDirectionsWS_id83 => LightDirectionalGroup.LightDirectionsWS.directLightGroups[0]
@C    LightColor_id84 => LightDirectionalGroup.LightColor.directLightGroups[0]
cbuffer PerPass [Stage: Pixel, Size: 2832]
@C    LightCount_id81 => DirectLightGroup.LightCount.directLightGroups[0]
@C    WorldToShadowCascadeUV_id148 => ShadowMapReceiverBase.WorldToShadowCascadeUV.directLightGroups[0]
@C    DepthBiases_id149 => ShadowMapReceiverBase.DepthBiases.directLightGroups[0]
@C    OffsetScales_id150 => ShadowMapReceiverBase.OffsetScales.directLightGroups[0]
@C    CascadeDepthSplits_id156 => ShadowMapReceiverDirectional.CascadeDepthSplits.directLightGroups[0]
cbuffer Globals [Stage: Pixel, Size: 3888]
@C    BlendMatrixArray_id37 => TransformationSkinning.BlendMatrixArray
@C    ShadowMapTextureSize_id86 => ShadowMap.TextureSize.directLightGroups[0]
@C    ShadowMapTextureTexelSize_id87 => ShadowMap.TextureTexelSize.directLightGroups[0]
@C    SphericalColors_id160 => SphericalHarmonicsEnvironmentColor.SphericalColors.lightDiffuseColor.environmentLights[0]
@C    MipCount_id162 => RoughnessCubeMapEnvironmentColor.MipCount.lightSpecularColor.environmentLights[0]
@C    SkyMatrix_id163 => LightSkyboxShader.SkyMatrix.environmentLights[0]
@C    Intensity_id164 => LightSkyboxShader.Intensity.environmentLights[0]
@C    scale_id170 => Material.TextureScale
@C    offset_id171 => Material.TextureOffset
@C    scale_id175 => Material.TextureScale.i1
@C    offset_id176 => Material.TextureOffset.i1
@C    constantColor_id183 => Material.SpecularValue
@C    constantFloat_id185 => Material.SpecularIntensityValue
***************************
******  Resources    ******
***************************
@R    PerFrame => PerFrame [Stage: Vertex, Slot: (0-0)]
@R    Globals => Globals [Stage: Vertex, Slot: (1-1)]
@R    LinearSampler_id118 => Texturing.LinearSampler [Stage: Pixel, Slot: (0-0)]
@R    LinearClampCompareLessEqualSampler_id120 => Texturing.LinearClampCompareLessEqualSampler [Stage: Pixel, Slot: (1-1)]
@R    Sampler_id168 => Material.Sampler.i0 [Stage: Pixel, Slot: (2-2)]
@R    ShadowMapTexture_id85 => ShadowMap.Texture.directLightGroups[0] [Stage: Pixel, Slot: (0-0)]
@R    CubeMap_id161 => RoughnessCubeMapEnvironmentColor.CubeMap.lightSpecularColor.environmentLights[0] [Stage: Pixel, Slot: (1-1)]
@R    Texture_id167 => Material.DiffuseMap [Stage: Pixel, Slot: (2-2)]
@R    Texture_id173 => Material.NormalMap [Stage: Pixel, Slot: (3-3)]
@R    PerFrame => PerFrame [Stage: Pixel, Slot: (0-0)]
@R    PerObject => PerObject [Stage: Pixel, Slot: (1-1)]
@R    PerPass => PerPass [Stage: Pixel, Slot: (2-2)]
@R    Globals => Globals [Stage: Pixel, Slot: (3-3)]
***************************
*****     Sources     *****
***************************
@S    ShaderBase => a82f902571734048b947e14b869afff5
@S    ShaderBaseStream => fc958f25c75bed221fe8c243536b9d86
@S    ShadingBase => e3d916eb38080d4811f8df2f534d29de
@S    ComputeColor => 3901ffe05d430cc3915caeb21db3602a
@S    TransformationBase => 03e527676224573bf843cf60b80cd44f
@S    NormalStream => 4540af543f57cb8c109068cc2bc84301
@S    TransformationWAndVP => 42cb38f5cd10f8e2398c532ff9245b30
@S    PositionStream4 => ced12be41d1f4f9f04922bedbd23198e
@S    PositionHStream4 => 38dbb36513aba5922571172c8d448a2f
@S    Transformation => 75adce3fafe5e2761c867d07ad2aa6bf
@S    NormalFromNormalMapping => e3e2c5155a7a61342bd61eb3382c59d9
@S    NormalBase => 2365a24f8e31759310d28841e25ab59e
@S    TransformationSkinning => 53d04b9bbc2da51de6e2641e22bf64fc
@S    NormalMeshSkinning => 87b099578710ac9fe339cc972f75be29
@S    NormalVSSkinningNormalMapping => b38135565059945f627b1239bd1ddccd
@S    MaterialSurfacePixelStageCompositor => b1897e7b0118bbc3fdb67fc86e06bcf6
@S    PositionStream => de40f77d9beb7d24178d0673b1c68081
@S    MaterialPixelShadingStream => 9b660568c8813df0e0d9f37484b0304d
@S    MaterialPixelStream => 0e42f54af4be2cd872b0e419eaaacfe6
@S    MaterialStream => 00b20ec736657b6b2726010b33d94bee
@S    IStreamInitializer => 31bfb616225addbe1f400c6a74fbc4f4
@S    LightStream => b93185c30b09579175c48dbe65100b45
@S    DirectLightGroupArray => ed54e8e92ce888648c51bf722b6f549d
@S    DirectLightGroup => e1676961b89ab6902e17961c1fa97275
@S    ShadowGroup => 80f6c4533117700c0a55069e39e7b188
@S    ShadowStream => 8a3eff7736ac12b27bd33af94d11d0df
@S    EnvironmentLightArray => caae53fa7b0620ae4916138989e329b7
@S    EnvironmentLight => 7e54037dee59f4e0088a0d7c7948aeeb
@S    IMaterialSurface => 5015bf3b76e828db602907933873c1c1
@S    LightDirectionalGroup => 043bac0a253fb64e8efcd2e7116c2825
@S    ShadowMapReceiverDirectional => 50af16a79ea27a607392478b251b37ed
@S    ShadowMapReceiverBase => 06a07ab0ac59d81210c1e9efd0ce234c
@S    ShadowMapGroup => 708dc117c1636d76cc6b9f02624aa125
@S    ShadowMapCommon => 0037de60295a563d6c0fa8bbbbf49211
@S    ShadowMapFilterBase => c04a6f581a0945a5c52ba9d5c88816b2
@S    Texturing => 5a079038962447a86765b54a9ab35acb
@S    ShadowMapFilterPcf => 90299d0749749ff6b58d637392e73a5c
@S    LightSkyboxShader => eb8d22c9f3a4f3d69abab733a780c55b
@S    IComputeEnvironmentColor => 31d6025d2a2e89eaea8b109be1e7f195
@S    SphericalHarmonicsEnvironmentColor => 1081be1c0543dc117d6ebd60d30ea385
@S    RoughnessCubeMapEnvironmentColor => ec0bd649861eaaaddbf34535c441f36b
@S    MaterialSurfaceArray => 218c4b5da17f46bc6280185ca81dc6d2
@S    MaterialSurfaceDiffuse => 81981b9f8a5d5952f6ab3656a80d364f
@S    IMaterialSurfacePixel => a9e1c66d616895593dcc563e90924423
@S    ComputeColorTextureScaledOffsetDynamicSampler => 6759804558e5db07e97dfa9a8019bb00
@S    DynamicTexture => 49498ddd3725616739553ed8d6099d60
@S    DynamicSampler => e62f9b3ad5183417cb123fe1b4ee19a3
@S    DynamicTextureStream => fa27970a58e24fbc35300f11b68cf523
@S    MaterialSurfaceNormalMap => 24854a8a60672b00d8a6e5713d4fa957
@S    MaterialSurfaceSetStreamFromComputeColor => 8e452be970a5b3b5553faa9ee522cb83
@S    IMaterialSurfaceVertex => a825402cf0d890ec76a1b340945f6d04
@S    MaterialVertexStream => 93271605ef3eb6ac78db19696d8e8e61
@S    MaterialDisplacementStream => 8377c2c280b876c1e27b3d4e2b375987
@S    IMaterialSurfaceDomain => c77d8be6cd1dce1503436ef03f81d54a
@S    MaterialDomainStream => f4bb48f62977e6e8657515ae02c0263b
@S    MaterialTessellationStream => 48e44e38f4c8491e3bd7a09371717135
@S    ComputeColorConstantColorLink => dac3e60615a3cd50762f2caed539c486
@S    ComputeColorConstantFloatLink => 5ff17fa065476da1bcd95a530b4adab0
@S    MaterialSurfaceLightingAndShading => ff7a59c53cbfb4bcf18e97f1e47fc59d
@S    Math => 26780ee7a692a8af892644c36f751ca6
@S    IMaterialSurfaceShading => 1c5d15582217ee03ebde23bef275b9e3
@S    MaterialSurfaceShadingDiffuseLambert => a1683f6dee229917b56115c8c4aa48d3
@S    MaterialSurfaceShadingSpecularMicrofacet => 2c2bb675289524a0f963e4dcdc95043e
@S    BRDFMicrofacet => 79fd54c46cf048d30de23c8dd91047aa
@S    IMaterialSpecularMicrofacetFresnelFunction => 0a49cf31545c0bf37c9e9dbfcee94bfa
@S    IMaterialSpecularMicrofacetVisibilityFunction => 8606f85b734fce892601e07dabe8f795
@S    IMaterialSpecularMicrofacetNormalDistributionFunction => be1a75f1cf30c21a2f9bfd8d6ca68b73
@S    MaterialSpecularMicrofacetFresnelSchlick => 98d247308ddd65d78f179129e5eb648c
@S    MaterialSpecularMicrofacetVisibilityImplicit => 101b2b8e8051458e72f433d1f0db5e58
@S    MaterialSpecularMicrofacetNormalDistributionBlinnPhong => 0284eea92e269035f4114566567b397a
***************************
*****     Stages      *****
***************************
@G    Vertex => 1d5326723a9c5e5544b8711cf338c1e1
@G    Pixel => 5c627fa79fe07e0114aafef440eb211f
***************************
*************************/

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightDirectionalGroup.pdxsl"
const static int TMaxLightCount_id82 = 8;

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverBase.pdxsl"
const static int TCascadeCountBase_id146 = 4;

#line 12
const static int TLightCountBase_id147 = 8;

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverDirectional.pdxsl"
const static int TCascadeCount_id151 = 4;

#line 12
const static int TLightCount_id152 = 8;

#line 12
const static bool TBlendCascades_id153 = false;

#line 12
const static bool TDepthRangeAuto_id154 = true;

#line 12
const static bool TCascadeDebug_id155 = false;

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapFilterPcf.pdxsl"
const static int TFilterSize_id157 = 5;

#line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SphericalHarmonicsEnvironmentColor.pdxsl"
const static int TOrder_id159 = 3;

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceNormalMap.pdxsl"
const static bool TIsNormalXY1_id177 = false;

#line 8
const static bool TScaleAndBias_id178 = true;

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceShadingDiffuseLambert.pdxsl"
const static bool TIsEnergyConservative_id189 = false;

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Utils/Math.pdxsl"
static const float PI_id191 = 3.14159265358979323846;

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapCommon.pdxsl"
Texture2D ShadowMapTexture_id85;

#line 47 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
SamplerState LinearSampler_id118 
{
    Filter = MIN_MAG_MIP_LINEAR;
};

#line 59
SamplerComparisonState LinearClampCompareLessEqualSampler_id120 
{
    Filter = COMPARISON_MIN_MAG_LINEAR_MIP_POINT;
    AddressU = Clamp;
    AddressV = Clamp;
    ComparisonFunc = LessEqual;
};

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/RoughnessCubeMapEnvironmentColor.pdxsl"
TextureCube CubeMap_id161;

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/DynamicTexture.pdxsl"
Texture2D Texture_id167;

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/DynamicSampler.pdxsl"
SamplerState Sampler_id168;

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/DynamicTexture.pdxsl"
Texture2D Texture_id173;
struct PS_STREAMS 
{

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 meshNormal_id14;

    #line 12
    float4 meshTangent_id15;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float4 PositionWS_id19;

    #line 114 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
    float2 TexCoord_id136;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float DepthVS_id20;

    #line 18 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3x3 tangentToWorld_id17;

    #line 44 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
    float3 viewWS_id65;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelShadingStream.pdxsl"
    float3 shadingColor_id70;

    #line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialStream.pdxsl"
    float matBlend_id41;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
    float3 matNormal_id49;

    #line 15
    float4 matColorBase_id50;

    #line 18
    float4 matDiffuse_id51;

    #line 50
    float3 matDiffuseVisible_id66;

    #line 24
    float3 matSpecular_id53;

    #line 54
    float3 matSpecularVisible_id68;

    #line 26
    float matSpecularIntensity_id54;

    #line 21
    float matGlossiness_id52;

    #line 52
    float alphaRoughness_id67;

    #line 28
    float matAmbientOcclusion_id55;

    #line 29
    float matAmbientOcclusionDirectLightingFactor_id56;

    #line 30
    float matCavity_id57;

    #line 31
    float matCavityDiffuse_id58;

    #line 32
    float matCavitySpecular_id59;

    #line 35
    float4 matEmissive_id60;

    #line 36
    float matEmissiveIntensity_id61;

    #line 39
    float2 matDiffuseSpecularAlphaBlend_id62;

    #line 40
    float3 matAlphaBlendColor_id63;

    #line 41
    float matAlphaDiscard_id64;

    #line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelShadingStream.pdxsl"
    float shadingColorAlpha_id71;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 normalWS_id16;

    #line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightStream.pdxsl"
    float3 lightDirectionWS_id42;

    #line 11
    float3 lightColor_id43;

    #line 12
    float3 lightColorNdotL_id44;

    #line 13
    float3 envLightDiffuseColor_id45;

    #line 14
    float3 envLightSpecularColor_id46;

    #line 19
    float lightDirectAmbientOcclusion_id48;

    #line 17
    float NdotL_id47;

    #line 56 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
    float NdotV_id69;

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowStream.pdxsl"
    float3 shadowColor_id80;

    #line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelShadingStream.pdxsl"
    float3 H_id72;

    #line 17
    float NdotH_id73;

    #line 20
    float LdotH_id74;

    #line 23
    float VdotH_id75;

    #line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBaseStream.pdxsl"
    float4 ColorTarget_id1;
};
struct PS_OUTPUT 
{

    #line 11
    float4 ColorTarget_id1 : SV_Target0;
};
struct VS_STREAMS 
{

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float4 Position_id18;

    #line 28 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/TransformationSkinning.pdxsl"
    uint4 BlendIndices_id39;

    #line 23
    float4 BlendWeights_id38;

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 meshNormal_id14;

    #line 12
    float4 meshTangent_id15;

    #line 114 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
    float2 TexCoord_id136;

    #line 31 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/TransformationSkinning.pdxsl"
    float4x4 skinningBlendMatrix_id40;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionHStream4.pdxsl"
    float4 PositionH_id21;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 normalWS_id16;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float4 PositionWS_id19;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBaseStream.pdxsl"
    float4 ShadingPosition_id0;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float DepthVS_id20;
};
struct VS_OUTPUT 
{

    #line 12
    float4 PositionWS_id19 : POSITION_WS;

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 meshNormal_id14 : NORMAL;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBaseStream.pdxsl"
    float4 ShadingPosition_id0 : SV_Position;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float DepthVS_id20 : DEPTH_VS;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float4 meshTangent_id15 : TANGENT;

    #line 114 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
    float2 TexCoord_id136 : TEXCOORD0;
};
struct VS_INPUT 
{

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float4 Position_id18 : POSITION;

    #line 28 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/TransformationSkinning.pdxsl"
    uint4 BlendIndices_id39 : BLENDINDICES;

    #line 23
    float4 BlendWeights_id38 : BLENDWEIGHT;

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 meshNormal_id14 : NORMAL;

    #line 12
    float4 meshTangent_id15 : TANGENT;

    #line 114 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
    float2 TexCoord_id136 : TEXCOORD0;
};
cbuffer PerFrame 
{

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shaders/Transformation.pdxsl"
    float4x4 ViewProjection_id26;

    #line 19
    float4 Eye_id28;
};
cbuffer PerObject 
{

    #line 26
    float4x4 World_id30;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightDirectionalGroup.pdxsl"
    float3 LightDirectionsWS_id83[TMaxLightCount_id82];

    #line 14
    float3 LightColor_id84[TMaxLightCount_id82];
};
cbuffer PerPass 
{

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/DirectLightGroup.pdxsl"
    int LightCount_id81;

    #line 16 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverBase.pdxsl"
    float4x4 WorldToShadowCascadeUV_id148[TCascadeCountBase_id146 * TLightCountBase_id147];

    #line 17
    float DepthBiases_id149[TLightCountBase_id147];

    #line 18
    float OffsetScales_id150[TLightCountBase_id147];

    #line 16 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverDirectional.pdxsl"
    float CascadeDepthSplits_id156[TCascadeCount_id151 * TLightCount_id152];
};
cbuffer Globals 
{

    #line 21 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/TransformationSkinning.pdxsl"
    float4x4 BlendMatrixArray_id37[56];

    #line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapCommon.pdxsl"
    float2 ShadowMapTextureSize_id86;

    #line 17
    float2 ShadowMapTextureTexelSize_id87;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SphericalHarmonicsEnvironmentColor.pdxsl"
    float3 SphericalColors_id160[TOrder_id159 * TOrder_id159];

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/RoughnessCubeMapEnvironmentColor.pdxsl"
    float MipCount_id162;

    #line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightSkyboxShader.pdxsl"
    float4x4 SkyMatrix_id163;

    #line 12
    float Intensity_id164;

    #line 24 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/ComputeColors/Shaders/ComputeColorTextureScaledOffsetDynamicSampler.pdxsl"
    float2 scale_id170;

    #line 27
    float2 offset_id171;

    #line 24
    float2 scale_id175;

    #line 27
    float2 offset_id176;

    #line 13 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/ComputeColors/Shaders/ComputeColorConstantColorLink.pdxsl"
    float4 constantColor_id183;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/ComputeColors/Shaders/ComputeColorConstantFloatLink.pdxsl"
    float constantFloat_id185;
};

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapFilterPcf.pdxsl"
float SampleTextureAndCompare_id83(float2 position, float positionDepth)
{

    #line 14
    return ShadowMapTexture_id85.SampleCmp(LinearClampCompareLessEqualSampler_id120, position, positionDepth);
}

#line 80 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/BRDF/BRDFMicrofacet.pdxsl"
float3 FresnelSchlick_id153(float3 f0, float3 f90, float lOrVDotH)
{

    #line 82
    return f0 + (f90 - f0) * pow((1 - lOrVDotH), 5);
}

#line 17 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapFilterPcf.pdxsl"
float FilterShadow_id79(float2 position, float positionDepth)
{

    #line 19

    #line 19
    float shadow = 0.0f;

    #line 23

    #line 23
    float2 uv = position * ShadowMapTextureSize_id86;

    #line 25

    #line 25
    float2 base_uv;

    #line 26
    base_uv.x = floor(uv.x + 0.5);

    #line 27
    base_uv.y = floor(uv.y + 0.5);

    #line 29

    #line 29
    float s = (uv.x + 0.5 - base_uv.x);

    #line 30

    #line 30
    float t = (uv.y + 0.5 - base_uv.y);

    #line 32
    base_uv -= float2(0.5, 0.5);

    #line 33
    base_uv *= ShadowMapTextureTexelSize_id87;

    {

        #line 62

        #line 62
        float uw0 = (4 - 3 * s);

        #line 63

        #line 63
        float uw1 = 7;

        #line 64

        #line 64
        float uw2 = (1 + 3 * s);

        #line 66

        #line 66
        float u0 = (3 - 2 * s) / uw0 - 2;

        #line 67

        #line 67
        float u1 = (3 + s) / uw1;

        #line 68

        #line 68
        float u2 = s / uw2 + 2;

        #line 70

        #line 70
        float vw0 = (4 - 3 * t);

        #line 71

        #line 71
        float vw1 = 7;

        #line 72

        #line 72
        float vw2 = (1 + 3 * t);

        #line 74

        #line 74
        float v0 = (3 - 2 * t) / vw0 - 2;

        #line 75

        #line 75
        float v1 = (3 + t) / vw1;

        #line 76

        #line 76
        float v2 = t / vw2 + 2;

        #line 78
        shadow += uw0 * vw0 * SampleTextureAndCompare_id83(base_uv + float2(u0, v0) * ShadowMapTextureTexelSize_id87, positionDepth);

        #line 79
        shadow += uw1 * vw0 * SampleTextureAndCompare_id83(base_uv + float2(u1, v0) * ShadowMapTextureTexelSize_id87, positionDepth);

        #line 80
        shadow += uw2 * vw0 * SampleTextureAndCompare_id83(base_uv + float2(u2, v0) * ShadowMapTextureTexelSize_id87, positionDepth);

        #line 81
        shadow += uw0 * vw1 * SampleTextureAndCompare_id83(base_uv + float2(u0, v1) * ShadowMapTextureTexelSize_id87, positionDepth);

        #line 82
        shadow += uw1 * vw1 * SampleTextureAndCompare_id83(base_uv + float2(u1, v1) * ShadowMapTextureTexelSize_id87, positionDepth);

        #line 83
        shadow += uw2 * vw1 * SampleTextureAndCompare_id83(base_uv + float2(u2, v1) * ShadowMapTextureTexelSize_id87, positionDepth);

        #line 84
        shadow += uw0 * vw2 * SampleTextureAndCompare_id83(base_uv + float2(u0, v2) * ShadowMapTextureTexelSize_id87, positionDepth);

        #line 85
        shadow += uw1 * vw2 * SampleTextureAndCompare_id83(base_uv + float2(u1, v2) * ShadowMapTextureTexelSize_id87, positionDepth);

        #line 86
        shadow += uw2 * vw2 * SampleTextureAndCompare_id83(base_uv + float2(u2, v2) * ShadowMapTextureTexelSize_id87, positionDepth);

        #line 88
        shadow /= 144.0f;
    }

    #line 132
    return shadow;
}

#line 27 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/BRDF/BRDFMicrofacet.pdxsl"
float NormalDistributionBlinnPhong_id185(float alphaR, float nDotH)
{

    #line 29

    #line 29
    float alphaR2 = max(alphaR * alphaR, 0.1);

    #line 30
    return pow(nDotH, 2 / alphaR2 - 2) / (PI_id191 * alphaR2);
}

#line 102
float VisibilityImplicit_id172(float nDotL, float nDotV)
{

    #line 105
    return 1.0f;
}

#line 72
float3 FresnelSchlick_id159(float3 f0, float lOrVDotH)
{

    #line 74
    return FresnelSchlick_id153(f0, 1.0f, lOrVDotH);
}

#line 27 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverBase.pdxsl"
float ComputeShadowFromCascade_id82(float3 shadowPositionWS, int cascadeIndex, int lightIndex)
{

    #line 32

    #line 32
    float3 shadowPosition = mul(float4(shadowPositionWS, 1), WorldToShadowCascadeUV_id148[cascadeIndex + lightIndex * TCascadeCountBase_id146]).xyz;

    #line 33

    #line 33
    float depthVS = shadowPosition.z;

    #line 34
    depthVS -= DepthBiases_id149[lightIndex];

    #line 36
    return FilterShadow_id79(shadowPosition.xy, depthVS);
}

#line 21
float3 GetShadowPositionOffset_id81(float offsetScale, float nDotL, float3 normal)
{

    #line 23

    #line 23
    float normalOffsetScale = saturate(1.0f - nDotL);

    #line 24
    return 2.0f * ShadowMapTextureTexelSize_id87.x * offsetScale * normalOffsetScale * normal;
}

#line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowGroup.pdxsl"
void ComputeShadow_id80(inout PS_STREAMS streams, int lightIndex)
{

    #line 12
    streams.shadowColor_id80 = 1.0f;
}

#line 194 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/BRDF/BRDFMicrofacet.pdxsl"
float3 EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id186(float3 specularColor, float alphaR, float nDotV)
{

    #line 196

    #line 196
    float x = 1 - alphaR;

    #line 197

    #line 197
    float y = nDotV;

    #line 199

    #line 199
    float b1 = -0.1688;

    #line 200

    #line 200
    float b2 = 1.895;

    #line 201

    #line 201
    float b3 = 0.9903;

    #line 202

    #line 202
    float b4 = -4.853;

    #line 203

    #line 203
    float b5 = 8.404;

    #line 204

    #line 204
    float b6 = -5.069;

    #line 205

    #line 205
    float bias = saturate(min(b1 * x + b2 * x * x, b3 + b4 * y + b5 * y * y + b6 * y * y * y));

    #line 207

    #line 207
    float d0 = 0.6045;

    #line 208

    #line 208
    float d1 = 1.699;

    #line 209

    #line 209
    float d2 = -0.5228;

    #line 210

    #line 210
    float d3 = -3.603;

    #line 211

    #line 211
    float d4 = 1.404;

    #line 212

    #line 212
    float d5 = 0.1939;

    #line 213

    #line 213
    float d6 = 2.661;

    #line 214

    #line 214
    float delta = saturate(d0 + d1 * x + d2 * y + d3 * x * x + d4 * x * y + d5 * y * y + d6 * x * x * x);

    #line 215

    #line 215
    float scale = delta - bias;

    #line 217
    bias *= saturate(50.0 * specularColor.y);

    #line 218
    return specularColor * scale + bias;
}

#line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/RoughnessCubeMapEnvironmentColor.pdxsl"
float4 Compute_id209(inout PS_STREAMS streams, float3 direction)
{

    #line 16

    #line 16
    float alpha = streams.alphaRoughness_id67;

    #line 17

    #line 17
    float mipLevel = sqrt(alpha) * MipCount_id162;

    #line 19
    return CubeMap_id161.SampleLevel(LinearSampler_id118, direction, mipLevel);
}

#line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SphericalHarmonicsEnvironmentColor.pdxsl"
float4 Compute_id204(float3 direction)
{

    #line 16

    #line 16
    float x = direction.x;

    #line 17

    #line 17
    float y = direction.y;

    #line 18

    #line 18
    float z = direction.z;

    #line 20

    #line 20
    float x2 = x * x;

    #line 21

    #line 21
    float y2 = y * y;

    #line 22

    #line 22
    float z2 = z * z;

    #line 24

    #line 24
    float3 color = SphericalColors_id160[0];

    {

        #line 28
        color += SphericalColors_id160[1] * y;

        #line 29
        color += SphericalColors_id160[2] * z;

        #line 30
        color += SphericalColors_id160[3] * x;

        {

            #line 34
            color += SphericalColors_id160[4] * y * x;

            #line 35
            color += SphericalColors_id160[5] * y * z;

            #line 36
            color += SphericalColors_id160[6] * (3.0 * z2 - 1.0);

            #line 37
            color += SphericalColors_id160[7] * x * z;

            #line 38
            color += SphericalColors_id160[8] * (x2 - y2);
        }
    }

    #line 68
    return float4(color, 1);
}

#line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSpecularMicrofacetNormalDistributionBlinnPhong.pdxsl"
float Compute_id283(inout PS_STREAMS streams)
{

    #line 12
    return NormalDistributionBlinnPhong_id185(streams.alphaRoughness_id67, streams.NdotH_id73);
}

#line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSpecularMicrofacetVisibilityImplicit.pdxsl"
float Compute_id253(inout PS_STREAMS streams)
{

    #line 12
    return VisibilityImplicit_id172(streams.NdotL_id47, streams.NdotV_id69);
}

#line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSpecularMicrofacetFresnelSchlick.pdxsl"
float3 Compute_id224(inout PS_STREAMS streams, float3 f0)
{

    #line 12
    return FresnelSchlick_id159(f0, streams.LdotH_id74);
}

#line 19 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverDirectional.pdxsl"
void ComputeShadow_id74(inout PS_STREAMS streams, int lightIndex)
{

    #line 21
    ComputeShadow_id80(streams, lightIndex);

    #line 23

    #line 23
    int cascadeIndexBase = lightIndex * TCascadeCount_id151;

    #line 26

    #line 26
    int cascadeIndex = 0;


    #line 27
    [unroll]
    for (
#line 28

    #line 28
    int i = 0; i < TCascadeCount_id151 - 1; i++)
    {

        #line 30
        [flatten]
        if (streams.DepthVS_id20 > CascadeDepthSplits_id156[cascadeIndexBase + i])
        {

            #line 33
            cascadeIndex = i + 1;
        }
    }

    #line 37

    #line 37
    float shadow = 1.0;

    #line 40

    #line 40
    float3 shadowPosition = streams.PositionWS_id19.xyz;

    #line 41
    shadowPosition += GetShadowPositionOffset_id81(OffsetScales_id150[lightIndex], streams.NdotL_id47, streams.normalWS_id16);

    #line 44
    if (cascadeIndex < TCascadeCount_id151)
    {

        #line 46
        shadow = ComputeShadowFromCascade_id82(shadowPosition, cascadeIndex, lightIndex);

        #line 48

        #line 48
        float nextSplit = CascadeDepthSplits_id156[cascadeIndexBase + cascadeIndex];

        #line 49

        #line 49
        float splitSize = cascadeIndex == 0 ? nextSplit : nextSplit - CascadeDepthSplits_id156[cascadeIndexBase + cascadeIndex - 1];

        #line 50

        #line 50
        float splitDist = (nextSplit - streams.DepthVS_id20) / splitSize;

        #line 51

        #line 51
        float lerpAmt = smoothstep(0.0f, 1.0f, splitDist);

        #line 53
        if (cascadeIndex == TCascadeCount_id151 - 1)
        {
        }

        #line 60
        else 
#line 60
        if (TBlendCascades_id153)
        {

            #line 62

            #line 62
            float nextShadow = ComputeShadowFromCascade_id82(shadowPosition, cascadeIndex + 1, lightIndex);

            #line 63
            shadow = lerp(nextShadow, shadow, lerpAmt);
        }
    }

    {

        #line 77
        streams.shadowColor_id80 = shadow;
    }
}

#line 25 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightDirectionalGroup.pdxsl"
void PrepareDirectLightCore_id73(inout PS_STREAMS streams, int lightIndex)
{

    #line 27
    streams.lightColor_id43 = LightColor_id84[lightIndex];

    #line 29
    streams.lightDirectionWS_id42 = -LightDirectionsWS_id83[lightIndex];
}

#line 92 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
float GetFilterSquareRoughnessAdjustment_id125(inout PS_STREAMS streams, float3 averageNormal)
{

    #line 98

    #line 98
    float r = length(streams.matNormal_id49);

    #line 99

    #line 99
    float roughnessAdjust = 0.0f;

    #line 100
    if (r < 1.0f)

        #line 101
        roughnessAdjust = 0.5 * (1 - r * r) / (3 * r - r * r * r);

    #line 103
    return roughnessAdjust;
}

#line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/IStreamInitializer.pdxsl"
void ResetStream_id189()
{
}

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationBase.pdxsl"
void PreTransformPosition_id4()
{
}

#line 29 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceShadingSpecularMicrofacet.pdxsl"
float3 ComputeEnvironmentLightContribution_id363(inout PS_STREAMS streams)
{

    #line 31

    #line 31
    float3 specularColor = streams.matSpecularVisible_id68;

    #line 35
    return EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id186(specularColor, streams.alphaRoughness_id67, streams.NdotV_id69) * streams.envLightSpecularColor_id46;
}

#line 21 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceShadingDiffuseLambert.pdxsl"
float3 ComputeEnvironmentLightContribution_id314(inout PS_STREAMS streams)
{

    #line 24

    #line 24
    float3 diffuseColor = streams.matDiffuseVisible_id66;

    #line 30
    return diffuseColor * streams.envLightDiffuseColor_id45;
}

#line 18 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightSkyboxShader.pdxsl"
void PrepareEnvironmentLight_id215(inout PS_STREAMS streams)
{

    #line 20

    #line 20
    float ambientAccessibility = streams.matAmbientOcclusion_id55;

    #line 27

    #line 27
    float3 sampleDirection = mul(streams.normalWS_id16, (float3x3)SkyMatrix_id163);

    #line 28
    sampleDirection = float3(sampleDirection.xy, -sampleDirection.z);

    #line 30
    streams.envLightDiffuseColor_id45 = Compute_id204(sampleDirection).rgb * Intensity_id164 * ambientAccessibility * streams.matDiffuseSpecularAlphaBlend_id62.x;

    #line 38
    sampleDirection = reflect(-streams.viewWS_id65, streams.normalWS_id16);

    #line 39
    sampleDirection = mul(sampleDirection, (float3x3)SkyMatrix_id163);

    #line 40
    sampleDirection = float3(sampleDirection.xy, -sampleDirection.z);

    #line 42
    streams.envLightSpecularColor_id46 = Compute_id209(streams, sampleDirection).rgb * Intensity_id164 * ambientAccessibility * streams.matDiffuseSpecularAlphaBlend_id62.y;
}

#line 16 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceShadingSpecularMicrofacet.pdxsl"
float3 ComputeDirectLightContribution_id362(inout PS_STREAMS streams)
{

    #line 18

    #line 18
    float3 specularColor = streams.matSpecularVisible_id68;

    #line 20

    #line 20
    float3 fresnel = Compute_id224(streams, specularColor);

    #line 21

    #line 21
    float geometricShadowing = Compute_id253(streams);

    #line 22

    #line 22
    float normalDistribution = Compute_id283(streams);

    #line 24

    #line 24
    float3 reflected = fresnel * geometricShadowing * normalDistribution / 4;

    #line 26
    return reflected * streams.lightColorNdotL_id44 * streams.matDiffuseSpecularAlphaBlend_id62.y;
}

#line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceShadingDiffuseLambert.pdxsl"
float3 ComputeDirectLightContribution_id313(inout PS_STREAMS streams)
{

    #line 12

    #line 12
    float3 diffuseColor = streams.matDiffuseVisible_id66;

    #line 18
    return diffuseColor / PI_id191 * streams.lightColorNdotL_id44 * streams.matDiffuseSpecularAlphaBlend_id62.x;
}

#line 32 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelShadingStream.pdxsl"
void PrepareMaterialPerDirectLight_id29(inout PS_STREAMS streams)
{

    #line 36
    streams.H_id72 = normalize(streams.viewWS_id65 + streams.lightDirectionWS_id42);

    #line 38
    streams.NdotH_id73 = max(dot(streams.normalWS_id16, streams.H_id72), 0.0001f);

    #line 39
    streams.LdotH_id74 = max(dot(streams.lightDirectionWS_id42, streams.H_id72), 0.0001f);

    #line 40
    streams.VdotH_id75 = streams.LdotH_id74;
}

#line 31 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/DirectLightGroup.pdxsl"
void PrepareDirectLight_id199(inout PS_STREAMS streams, int lightIndex)
{

    #line 33
    PrepareDirectLightCore_id73(streams, lightIndex);

    #line 36
    streams.NdotL_id47 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id42), 0.0001f);

    #line 39
    ComputeShadow_id74(streams, lightIndex);

    #line 42
    streams.lightColorNdotL_id44 = streams.lightColor_id43 * streams.shadowColor_id80 * streams.NdotL_id47 * streams.lightDirectAmbientOcclusion_id48;
}

#line 23
int GetLightCount_id197()
{

    #line 25
    return LightCount_id81;
}

#line 17 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightDirectionalGroup.pdxsl"
int GetMaxLightCount_id200()
{

    #line 19
    return TMaxLightCount_id82;
}

#line 106 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
void PrepareMaterialForLightingAndShading_id188(inout PS_STREAMS streams)
{

    #line 109
    streams.lightDirectAmbientOcclusion_id48 = lerp(1.0, streams.matAmbientOcclusion_id55, streams.matAmbientOcclusionDirectLightingFactor_id56);

    #line 112
    streams.matDiffuseVisible_id66 = streams.matDiffuse_id51.rgb * lerp(1.0f, streams.matCavity_id57, streams.matCavityDiffuse_id58) * streams.matDiffuseSpecularAlphaBlend_id62.r * streams.matAlphaBlendColor_id63;

    #line 113
    streams.matSpecularVisible_id68 = streams.matSpecular_id53.rgb * streams.matSpecularIntensity_id54 * lerp(1.0f, streams.matCavity_id57, streams.matCavitySpecular_id59) * streams.matDiffuseSpecularAlphaBlend_id62.g * streams.matAlphaBlendColor_id63;

    #line 115
    streams.NdotV_id69 = max(dot(streams.normalWS_id16, streams.viewWS_id65), 0.0001f);

    #line 118

    #line 118
    float roughness = 1.0f - streams.matGlossiness_id52;

    #line 121

    #line 121
    float roughnessAdjust = GetFilterSquareRoughnessAdjustment_id125(streams, streams.matNormal_id49);

    #line 125
    streams.alphaRoughness_id67 = max(roughness * roughness + roughnessAdjust, 0.001);
}

#line 21 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightStream.pdxsl"
void ResetLightStream_id187(inout PS_STREAMS streams)
{

    #line 23
    streams.lightDirectionWS_id42 = 0;

    #line 24
    streams.lightColor_id43 = 0;

    #line 25
    streams.lightColorNdotL_id44 = 0;

    #line 26
    streams.envLightDiffuseColor_id45 = 0;

    #line 27
    streams.envLightSpecularColor_id46 = 0;

    #line 28
    streams.lightDirectAmbientOcclusion_id48 = 1.0f;

    #line 29
    streams.NdotL_id47 = 0;
}

#line 45 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
void UpdateNormalFromTangentSpace_id12(inout PS_STREAMS streams, float3 normalInTangentSpace)
{

    #line 47
    streams.normalWS_id16 = normalize(mul(normalInTangentSpace, streams.tangentToWorld_id17));
}

#line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/ComputeColors/Shaders/ComputeColorConstantFloatLink.pdxsl"
float4 Compute_id222()
{

    #line 16
    return float4(constantFloat_id185, constantFloat_id185, constantFloat_id185, constantFloat_id185);
}

#line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/ComputeColors/Shaders/ComputeColorConstantColorLink.pdxsl"
float4 Compute_id220()
{

    #line 17
    return constantColor_id183;
}

#line 29 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/ComputeColors/Shaders/ComputeColorTextureScaledOffsetDynamicSampler.pdxsl"
float4 Compute_id218(inout PS_STREAMS streams)
{

    #line 30
    return Texture_id173.Sample(Sampler_id168, streams.TexCoord_id136 * scale_id175 + offset_id176).rgba;
}

#line 29
float4 Compute_id216(inout PS_STREAMS streams)
{

    #line 30
    return Texture_id167.Sample(Sampler_id168, streams.TexCoord_id136 * scale_id170 + offset_id171).rgba;
}

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialStream.pdxsl"
void ResetStream_id192(inout PS_STREAMS streams)
{

    #line 14
    ResetStream_id189();

    #line 18
    streams.matBlend_id41 = 0.0f;
}

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationWAndVP.pdxsl"
void PreTransformPosition_id13(inout VS_STREAMS streams)
{

    #line 10
    PreTransformPosition_id4();

    #line 11
    streams.PositionWS_id19 = mul(streams.Position_id18, World_id30);
}

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceLightingAndShading.pdxsl"
void Compute_id398(inout PS_STREAMS streams)
{

    #line 16
    UpdateNormalFromTangentSpace_id12(streams, streams.matNormal_id49);

    #line 19
    ResetLightStream_id187(streams);

    #line 22
    PrepareMaterialForLightingAndShading_id188(streams);

    #line 27

    #line 27
    float3 directLightingContribution = 0;

    {

        #line 30

        #line 30
        const int maxLightCount = GetMaxLightCount_id200();

        #line 31

        #line 31
        int count = GetLightCount_id197();


        #line 34
        for (
#line 34

        #line 34
        int i = 0; i < maxLightCount; i++)
        {

            #line 36
            if (i >= count)
            {

                #line 38
                break;
            }

            #line 42
            PrepareDirectLight_id199(streams, i);

            #line 45
            PrepareMaterialPerDirectLight_id29(streams);

            {

                #line 50
                directLightingContribution += ComputeDirectLightContribution_id313(streams);
            }

            {

                #line 50
                directLightingContribution += ComputeDirectLightContribution_id362(streams);
            }
        }
    }

    #line 58

    #line 58
    float3 environmentLightingContribution = 0;

    {

        #line 62
        PrepareEnvironmentLight_id215(streams);

        {

            #line 67
            environmentLightingContribution += ComputeEnvironmentLightContribution_id314(streams);
        }

        {

            #line 67
            environmentLightingContribution += ComputeEnvironmentLightContribution_id363(streams);
        }
    }

    #line 72
    streams.shadingColor_id70 += directLightingContribution * PI_id191 + environmentLightingContribution;

    #line 73
    streams.shadingColorAlpha_id71 = streams.matDiffuse_id51.a;
}

#line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceSetStreamFromComputeColor.pdxsl"
void Compute_id383(inout PS_STREAMS streams)
{

    #line 11
    streams.matSpecularIntensity_id54 = Compute_id222().r;
}

#line 9
void Compute_id378(inout PS_STREAMS streams)
{

    #line 11
    streams.matSpecular_id53 = Compute_id220().rgb;
}

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceNormalMap.pdxsl"
void Compute_id373(inout PS_STREAMS streams)
{

    #line 14

    #line 14
    float4 normal = Compute_id218(streams);

    #line 18
    if (normal.z == 0)
    {

        #line 21
        streams.matNormal_id49 = float3(normal.xy, 1);
    }

    #line 24
    else
    {

        {

            #line 27
            normal = (2.0f * normal) - 1.0f;
        }

        {

            #line 38
            streams.matNormal_id49 = normal.xyz;
        }
    }
}

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceDiffuse.pdxsl"
void Compute_id368(inout PS_STREAMS streams)
{

    #line 14

    #line 14
    float4 colorBase = Compute_id216(streams);

    #line 15
    streams.matDiffuse_id51 = colorBase;

    #line 19
    streams.matColorBase_id50 = colorBase;
}

#line 58 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
void ResetStream_id194(inout PS_STREAMS streams)
{

    #line 60
    ResetStream_id192(streams);

    #line 64
    streams.matNormal_id49 = float3(0, 0, 1);

    #line 66
    streams.matColorBase_id50 = 0.0f;

    #line 67
    streams.matDiffuse_id51 = 0.0f;

    #line 68
    streams.matDiffuseVisible_id66 = 0.0f;

    #line 70
    streams.matSpecular_id53 = 0.0f;

    #line 71
    streams.matSpecularVisible_id68 = 0.0f;

    #line 72
    streams.matSpecularIntensity_id54 = 1.0f;

    #line 74
    streams.matGlossiness_id52 = 0.0f;

    #line 75
    streams.alphaRoughness_id67 = 1.0f;

    #line 77
    streams.matAmbientOcclusion_id55 = 1.0f;

    #line 78
    streams.matAmbientOcclusionDirectLightingFactor_id56 = 0.0f;

    #line 80
    streams.matCavity_id57 = 1.0f;

    #line 81
    streams.matCavityDiffuse_id58 = 0.0f;

    #line 82
    streams.matCavitySpecular_id59 = 0.0f;

    #line 84
    streams.matEmissive_id60 = 0.0f;

    #line 85
    streams.matEmissiveIntensity_id61 = 0.0f;

    #line 87
    streams.matDiffuseSpecularAlphaBlend_id62 = 1.0f;

    #line 88
    streams.matAlphaBlendColor_id63 = 1.0f;

    #line 89
    streams.matAlphaDiscard_id64 = 0.0f;
}

#line 18 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationBase.pdxsl"
void PostTransformPosition_id6()
{
}

#line 33 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/TransformationSkinning.pdxsl"
void PreTransformPosition_id19(inout VS_STREAMS streams)
{

    #line 35
    PreTransformPosition_id13(streams);

    #line 37
    streams.skinningBlendMatrix_id40 = BlendMatrixArray_id37[streams.BlendIndices_id39[0]] * streams.BlendWeights_id38[0] + BlendMatrixArray_id37[streams.BlendIndices_id39[1]] * streams.BlendWeights_id38[1] + BlendMatrixArray_id37[streams.BlendIndices_id39[2]] * streams.BlendWeights_id38[2] + BlendMatrixArray_id37[streams.BlendIndices_id39[3]] * streams.BlendWeights_id38[3];

    #line 41

    #line 41
    float4 blendPos = mul(float4(streams.Position_id18.xyz, 1.0f), streams.skinningBlendMatrix_id40);

    #line 42
    blendPos /= blendPos.w;

    #line 43
    streams.PositionWS_id19 = blendPos;
}

#line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceArray.pdxsl"
void Compute_id70(inout PS_STREAMS streams)
{

    {

        #line 13
        Compute_id368(streams);
    }

    {

        #line 13
        Compute_id373(streams);
    }

    {

        #line 13
        Compute_id378(streams);
    }

    {

        #line 13
        Compute_id383(streams);
    }

    {

        #line 13
        Compute_id398(streams);
    }
}

#line 25 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelShadingStream.pdxsl"
void ResetStream_id69(inout PS_STREAMS streams)
{

    #line 27
    ResetStream_id194(streams);

    #line 28
    streams.shadingColorAlpha_id71 = 1.0f;
}

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/NormalVSSkinningNormalMapping.pdxsl"
float3x3 GetTangentWorldTransform_id21()
{

    #line 11
    return float3x3(1, 0, 0, 0, 1, 0, 0, 0, 1);
}

#line 20 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
float3x3 GetTangentMatrix_id9(inout PS_STREAMS streams)
{

    #line 22

    #line 22
    float3x3 tangentMatrix;

    #line 24
    streams.meshNormal_id14 = normalize(streams.meshNormal_id14);

    #line 25

    #line 25
    float3 tangent = normalize(streams.meshTangent_id15.xyz);

    #line 26

    #line 26
    float3 bitangent = streams.meshTangent_id15.w * cross(streams.meshNormal_id14, tangent);

    #line 27
    tangentMatrix = float3x3(tangent, bitangent, streams.meshNormal_id14);

    #line 29
    return tangentMatrix;
}

#line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationWAndVP.pdxsl"
void PostTransformPosition_id14(inout VS_STREAMS streams)
{

    #line 16
    PostTransformPosition_id6();

    #line 17
    streams.ShadingPosition_id0 = mul(streams.PositionWS_id19, ViewProjection_id26);

    #line 18
    streams.PositionH_id21 = streams.ShadingPosition_id0;

    #line 19
    streams.DepthVS_id20 = streams.ShadingPosition_id0.w;
}

#line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationBase.pdxsl"
void TransformPosition_id5()
{
}

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/NormalMeshSkinning.pdxsl"
void PreTransformPosition_id20(inout VS_STREAMS streams)
{

    #line 10
    PreTransformPosition_id19(streams);

    #line 11
    streams.meshNormal_id14 = normalize(mul(streams.meshNormal_id14, (float3x3)streams.skinningBlendMatrix_id40));
}

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfacePixelStageCompositor.pdxsl"
float4 Shading_id30(inout PS_STREAMS streams)
{

    #line 14
    streams.viewWS_id65 = normalize(Eye_id28.xyz - streams.PositionWS_id19.xyz);

    #line 15
    streams.shadingColor_id70 = 0;

    #line 18
    ResetStream_id69(streams);

    #line 22
    Compute_id70(streams);

    #line 25
    return float4(streams.shadingColor_id70, streams.shadingColorAlpha_id71);
}

#line 18 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBase.pdxsl"
void PSMain_id1()
{
}

#line 32 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
void UpdateTangentToWorld_id11(inout PS_STREAMS streams)
{

    #line 34

    #line 34
    float3x3 tangentMatrix = GetTangentMatrix_id9(streams);

    #line 35

    #line 35
    float3x3 tangentWorldTransform = GetTangentWorldTransform_id21();

    #line 36
    streams.tangentToWorld_id17 = mul(tangentMatrix, tangentWorldTransform);
}

#line 30 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalBase.pdxsl"
void GenerateNormal_PS_id16()
{
}

#line 20 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationBase.pdxsl"
void BaseTransformVS_id7(inout VS_STREAMS streams)
{

    #line 22
    PreTransformPosition_id20(streams);

    #line 23
    TransformPosition_id5();

    #line 24
    PostTransformPosition_id14(streams);
}

#line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBase.pdxsl"
void VSMain_id0()
{
}

#line 46 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/ShadingBase.pdxsl"
void PSMain_id3(inout PS_STREAMS streams)
{

    #line 48
    PSMain_id1();

    #line 49
    streams.ColorTarget_id1 = Shading_id30(streams);
}

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalFromNormalMapping.pdxsl"
void GenerateNormal_PS_id17(inout PS_STREAMS streams)
{

    #line 10
    GenerateNormal_PS_id16();

    #line 11
    UpdateTangentToWorld_id11(streams);
}

#line 25 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalBase.pdxsl"
void GenerateNormal_VS_id15(inout VS_STREAMS streams)
{

    #line 27
    streams.normalWS_id16 = 0.0f;
}

#line 27 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationBase.pdxsl"
void VSMain_id8(inout VS_STREAMS streams)
{

    #line 29
    VSMain_id0();

    #line 30
    BaseTransformVS_id7(streams);
}

#line 17 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalBase.pdxsl"
PS_OUTPUT PSMain(VS_OUTPUT __input__)
{
    PS_STREAMS streams = (PS_STREAMS)0;
    streams.PositionWS_id19 = __input__.PositionWS_id19;
    streams.meshNormal_id14 = __input__.meshNormal_id14;
    streams.DepthVS_id20 = __input__.DepthVS_id20;
    streams.meshTangent_id15 = __input__.meshTangent_id15;
    streams.TexCoord_id136 = __input__.TexCoord_id136;

    #line 21
    GenerateNormal_PS_id17(streams);

    #line 22
    PSMain_id3(streams);
    PS_OUTPUT __output__ = (PS_OUTPUT)0;
    __output__.ColorTarget_id1 = streams.ColorTarget_id1;
    return __output__;
}

#line 8
VS_OUTPUT VSMain(VS_INPUT __input__)
{
    VS_STREAMS streams = (VS_STREAMS)0;
    streams.Position_id18 = __input__.Position_id18;
    streams.BlendIndices_id39 = __input__.BlendIndices_id39;
    streams.BlendWeights_id38 = __input__.BlendWeights_id38;
    streams.meshNormal_id14 = __input__.meshNormal_id14;
    streams.meshTangent_id15 = __input__.meshTangent_id15;
    streams.TexCoord_id136 = __input__.TexCoord_id136;

    #line 10
    VSMain_id8(streams);

    #line 14
    GenerateNormal_VS_id15(streams);
    VS_OUTPUT __output__ = (VS_OUTPUT)0;
    __output__.PositionWS_id19 = streams.PositionWS_id19;
    __output__.meshNormal_id14 = streams.meshNormal_id14;
    __output__.ShadingPosition_id0 = streams.ShadingPosition_id0;
    __output__.DepthVS_id20 = streams.DepthVS_id20;
    __output__.meshTangent_id15 = streams.meshTangent_id15;
    __output__.TexCoord_id136 = streams.TexCoord_id136;
    return __output__;
}
