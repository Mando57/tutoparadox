/**************************
***** Used Parameters *****
***************************
@P EffectName: ParadoxForwardShadingEffect
@P CompilerParameters.DebugKey: True
@P LightSkyboxShader.LightDiffuseColor.environmentLights[0]: SphericalHarmonicsEnvironmentColor<3>
@P Lighting.EnvironmentLights: pdxfx LightSkyboxEffect
@P LightSkyboxShader.LightSpecularColor.environmentLights[0]: RoughnessCubeMapEnvironmentColor
@P Material.PixelStageStreamInitializer: mixin MaterialStream, MaterialPixelShadingStream
@P Material.HasNormalMap: False
@P Material.HasSkinningPosition: False
@P ParadoxEffectBase.ExtensionPostVertexStageShader: null
@P Material.PixelStageSurfaceShaders: mixin MaterialSurfaceArray [{layers = [mixin MaterialSurfaceDiffuse [{diffuseMap = ComputeColorConstantColorLink<Material.DiffuseValue>}], mixin MaterialSurfaceLightingAndShading [{surfaces = [MaterialSurfaceShadingDiffuseLambert<false>]}]]}]
@P Material.TessellationShader: null
@P Lighting.DirectLightGroups: mixin LightDirectionalGroup<8>, ShadowMapReceiverDirectional<4,8,false,true,false>, ShadowMapFilterPcf<5>
@P CompilerParameters.GraphicsPlatformKey: Direct3D11
@P Material.PixelStageSurfaceFilter: null
@P CompilerParameters.GraphicsProfileKey: Level_10_0
@P Material.VertexStageSurfaceShaders: null
***************************
****  ConstantBuffers  ****
***************************
cbuffer PerFrame [Stage: Vertex, Size: 80]
@C    ViewProjection_id26 => Transformation.ViewProjection
@C    Eye_id28 => Transformation.Eye
cbuffer PerObject [Stage: Vertex, Size: 384]
@C    World_id30 => Transformation.World
@C    WorldInverseTranspose_id31 => Transformation.WorldInverseTranspose
@C    LightDirectionsWS_id79 => LightDirectionalGroup.LightDirectionsWS.directLightGroups[0]
@C    LightColor_id80 => LightDirectionalGroup.LightColor.directLightGroups[0]
cbuffer PerObject [Stage: Pixel, Size: 384]
@C    World_id30 => Transformation.World
@C    WorldInverseTranspose_id31 => Transformation.WorldInverseTranspose
@C    LightDirectionsWS_id79 => LightDirectionalGroup.LightDirectionsWS.directLightGroups[0]
@C    LightColor_id80 => LightDirectionalGroup.LightColor.directLightGroups[0]
cbuffer PerPass [Stage: Pixel, Size: 2832]
@C    LightCount_id77 => DirectLightGroup.LightCount.directLightGroups[0]
@C    WorldToShadowCascadeUV_id144 => ShadowMapReceiverBase.WorldToShadowCascadeUV.directLightGroups[0]
@C    DepthBiases_id145 => ShadowMapReceiverBase.DepthBiases.directLightGroups[0]
@C    OffsetScales_id146 => ShadowMapReceiverBase.OffsetScales.directLightGroups[0]
@C    CascadeDepthSplits_id152 => ShadowMapReceiverDirectional.CascadeDepthSplits.directLightGroups[0]
cbuffer Globals [Stage: Pixel, Size: 256]
@C    ShadowMapTextureSize_id82 => ShadowMap.TextureSize.directLightGroups[0]
@C    ShadowMapTextureTexelSize_id83 => ShadowMap.TextureTexelSize.directLightGroups[0]
@C    SphericalColors_id156 => SphericalHarmonicsEnvironmentColor.SphericalColors.lightDiffuseColor.environmentLights[0]
@C    MipCount_id158 => RoughnessCubeMapEnvironmentColor.MipCount.lightSpecularColor.environmentLights[0]
@C    SkyMatrix_id159 => LightSkyboxShader.SkyMatrix.environmentLights[0]
@C    Intensity_id160 => LightSkyboxShader.Intensity.environmentLights[0]
@C    constantColor_id163 => Material.DiffuseValue
***************************
******  Resources    ******
***************************
@R    PerFrame => PerFrame [Stage: Vertex, Slot: (0-0)]
@R    PerObject => PerObject [Stage: Vertex, Slot: (1-1)]
@R    LinearClampCompareLessEqualSampler_id116 => Texturing.LinearClampCompareLessEqualSampler [Stage: Pixel, Slot: (0-0)]
@R    ShadowMapTexture_id81 => ShadowMap.Texture.directLightGroups[0] [Stage: Pixel, Slot: (0-0)]
@R    PerObject => PerObject [Stage: Pixel, Slot: (0-0)]
@R    PerPass => PerPass [Stage: Pixel, Slot: (1-1)]
@R    Globals => Globals [Stage: Pixel, Slot: (2-2)]
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
@S    NormalFromMesh => 5b46e05fa4cc57da5eab3133454b40a2
@S    NormalBase => 2365a24f8e31759310d28841e25ab59e
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
@S    ComputeColorConstantColorLink => dac3e60615a3cd50762f2caed539c486
@S    MaterialSurfaceLightingAndShading => ff7a59c53cbfb4bcf18e97f1e47fc59d
@S    Math => 26780ee7a692a8af892644c36f751ca6
@S    IMaterialSurfaceShading => 1c5d15582217ee03ebde23bef275b9e3
@S    MaterialSurfaceShadingDiffuseLambert => a1683f6dee229917b56115c8c4aa48d3
***************************
*****     Stages      *****
***************************
@G    Vertex => a983cee509465a02ad14533a5351f19f
@G    Pixel => 4f9449680e4bc5ac3b7b82bbb366130b
***************************
*************************/

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightDirectionalGroup.pdxsl"
const static int TMaxLightCount_id78 = 8;

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverBase.pdxsl"
const static int TCascadeCountBase_id142 = 4;

#line 12
const static int TLightCountBase_id143 = 8;

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverDirectional.pdxsl"
const static int TCascadeCount_id147 = 4;

#line 12
const static int TLightCount_id148 = 8;

#line 12
const static bool TBlendCascades_id149 = false;

#line 12
const static bool TDepthRangeAuto_id150 = true;

#line 12
const static bool TCascadeDebug_id151 = false;

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapFilterPcf.pdxsl"
const static int TFilterSize_id153 = 5;

#line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SphericalHarmonicsEnvironmentColor.pdxsl"
const static int TOrder_id155 = 3;

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Utils/Math.pdxsl"
static const float PI_id166 = 3.14159265358979323846;

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceShadingDiffuseLambert.pdxsl"
const static bool TIsEnergyConservative_id167 = false;

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapCommon.pdxsl"
Texture2D ShadowMapTexture_id81;

#line 47 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
SamplerState LinearSampler_id114 
{
    Filter = MIN_MAG_MIP_LINEAR;
};

#line 59
SamplerComparisonState LinearClampCompareLessEqualSampler_id116 
{
    Filter = COMPARISON_MIN_MAG_LINEAR_MIP_POINT;
    AddressU = Clamp;
    AddressV = Clamp;
    ComparisonFunc = LessEqual;
};

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/RoughnessCubeMapEnvironmentColor.pdxsl"
TextureCube CubeMap_id157;
struct PS_STREAMS 
{

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 normalWS_id16;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float4 PositionWS_id19;

    #line 15
    float DepthVS_id20;

    #line 44 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
    float3 viewWS_id61;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelShadingStream.pdxsl"
    float3 shadingColor_id66;

    #line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialStream.pdxsl"
    float matBlend_id37;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
    float3 matNormal_id45;

    #line 15
    float4 matColorBase_id46;

    #line 18
    float4 matDiffuse_id47;

    #line 50
    float3 matDiffuseVisible_id62;

    #line 24
    float3 matSpecular_id49;

    #line 54
    float3 matSpecularVisible_id64;

    #line 26
    float matSpecularIntensity_id50;

    #line 21
    float matGlossiness_id48;

    #line 52
    float alphaRoughness_id63;

    #line 28
    float matAmbientOcclusion_id51;

    #line 29
    float matAmbientOcclusionDirectLightingFactor_id52;

    #line 30
    float matCavity_id53;

    #line 31
    float matCavityDiffuse_id54;

    #line 32
    float matCavitySpecular_id55;

    #line 35
    float4 matEmissive_id56;

    #line 36
    float matEmissiveIntensity_id57;

    #line 39
    float2 matDiffuseSpecularAlphaBlend_id58;

    #line 40
    float3 matAlphaBlendColor_id59;

    #line 41
    float matAlphaDiscard_id60;

    #line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelShadingStream.pdxsl"
    float shadingColorAlpha_id67;

    #line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightStream.pdxsl"
    float3 lightDirectionWS_id38;

    #line 11
    float3 lightColor_id39;

    #line 12
    float3 lightColorNdotL_id40;

    #line 13
    float3 envLightDiffuseColor_id41;

    #line 14
    float3 envLightSpecularColor_id42;

    #line 19
    float lightDirectAmbientOcclusion_id44;

    #line 17
    float NdotL_id43;

    #line 56 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
    float NdotV_id65;

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowStream.pdxsl"
    float3 shadowColor_id76;

    #line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelShadingStream.pdxsl"
    float3 H_id68;

    #line 17
    float NdotH_id69;

    #line 20
    float LdotH_id70;

    #line 23
    float VdotH_id71;

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

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 meshNormal_id14;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionHStream4.pdxsl"
    float4 PositionH_id21;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float4 PositionWS_id19;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBaseStream.pdxsl"
    float4 ShadingPosition_id0;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float DepthVS_id20;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 normalWS_id16;
};
struct VS_OUTPUT 
{

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float4 PositionWS_id19 : POSITION_WS;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBaseStream.pdxsl"
    float4 ShadingPosition_id0 : SV_Position;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float DepthVS_id20 : DEPTH_VS;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 normalWS_id16 : NORMALWS;
};
struct VS_INPUT 
{

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float4 Position_id18 : POSITION;

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 meshNormal_id14 : NORMAL;
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

    #line 28
    float4x4 WorldInverseTranspose_id31;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightDirectionalGroup.pdxsl"
    float3 LightDirectionsWS_id79[TMaxLightCount_id78];

    #line 14
    float3 LightColor_id80[TMaxLightCount_id78];
};
cbuffer PerPass 
{

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/DirectLightGroup.pdxsl"
    int LightCount_id77;

    #line 16 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverBase.pdxsl"
    float4x4 WorldToShadowCascadeUV_id144[TCascadeCountBase_id142 * TLightCountBase_id143];

    #line 17
    float DepthBiases_id145[TLightCountBase_id143];

    #line 18
    float OffsetScales_id146[TLightCountBase_id143];

    #line 16 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverDirectional.pdxsl"
    float CascadeDepthSplits_id152[TCascadeCount_id147 * TLightCount_id148];
};
cbuffer Globals 
{

    #line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapCommon.pdxsl"
    float2 ShadowMapTextureSize_id82;

    #line 17
    float2 ShadowMapTextureTexelSize_id83;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SphericalHarmonicsEnvironmentColor.pdxsl"
    float3 SphericalColors_id156[TOrder_id155 * TOrder_id155];

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/RoughnessCubeMapEnvironmentColor.pdxsl"
    float MipCount_id158;

    #line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightSkyboxShader.pdxsl"
    float4x4 SkyMatrix_id159;

    #line 12
    float Intensity_id160;

    #line 13 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/ComputeColors/Shaders/ComputeColorConstantColorLink.pdxsl"
    float4 constantColor_id163;
};

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapFilterPcf.pdxsl"
float SampleTextureAndCompare_id63(float2 position, float positionDepth)
{

    #line 14
    return ShadowMapTexture_id81.SampleCmp(LinearClampCompareLessEqualSampler_id116, position, positionDepth);
}

#line 17
float FilterShadow_id59(float2 position, float positionDepth)
{

    #line 19

    #line 19
    float shadow = 0.0f;

    #line 23

    #line 23
    float2 uv = position * ShadowMapTextureSize_id82;

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
    base_uv *= ShadowMapTextureTexelSize_id83;

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
        shadow += uw0 * vw0 * SampleTextureAndCompare_id63(base_uv + float2(u0, v0) * ShadowMapTextureTexelSize_id83, positionDepth);

        #line 79
        shadow += uw1 * vw0 * SampleTextureAndCompare_id63(base_uv + float2(u1, v0) * ShadowMapTextureTexelSize_id83, positionDepth);

        #line 80
        shadow += uw2 * vw0 * SampleTextureAndCompare_id63(base_uv + float2(u2, v0) * ShadowMapTextureTexelSize_id83, positionDepth);

        #line 81
        shadow += uw0 * vw1 * SampleTextureAndCompare_id63(base_uv + float2(u0, v1) * ShadowMapTextureTexelSize_id83, positionDepth);

        #line 82
        shadow += uw1 * vw1 * SampleTextureAndCompare_id63(base_uv + float2(u1, v1) * ShadowMapTextureTexelSize_id83, positionDepth);

        #line 83
        shadow += uw2 * vw1 * SampleTextureAndCompare_id63(base_uv + float2(u2, v1) * ShadowMapTextureTexelSize_id83, positionDepth);

        #line 84
        shadow += uw0 * vw2 * SampleTextureAndCompare_id63(base_uv + float2(u0, v2) * ShadowMapTextureTexelSize_id83, positionDepth);

        #line 85
        shadow += uw1 * vw2 * SampleTextureAndCompare_id63(base_uv + float2(u1, v2) * ShadowMapTextureTexelSize_id83, positionDepth);

        #line 86
        shadow += uw2 * vw2 * SampleTextureAndCompare_id63(base_uv + float2(u2, v2) * ShadowMapTextureTexelSize_id83, positionDepth);

        #line 88
        shadow /= 144.0f;
    }

    #line 132
    return shadow;
}

#line 27 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverBase.pdxsl"
float ComputeShadowFromCascade_id62(float3 shadowPositionWS, int cascadeIndex, int lightIndex)
{

    #line 32

    #line 32
    float3 shadowPosition = mul(float4(shadowPositionWS, 1), WorldToShadowCascadeUV_id144[cascadeIndex + lightIndex * TCascadeCountBase_id142]).xyz;

    #line 33

    #line 33
    float depthVS = shadowPosition.z;

    #line 34
    depthVS -= DepthBiases_id145[lightIndex];

    #line 36
    return FilterShadow_id59(shadowPosition.xy, depthVS);
}

#line 21
float3 GetShadowPositionOffset_id61(float offsetScale, float nDotL, float3 normal)
{

    #line 23

    #line 23
    float normalOffsetScale = saturate(1.0f - nDotL);

    #line 24
    return 2.0f * ShadowMapTextureTexelSize_id83.x * offsetScale * normalOffsetScale * normal;
}

#line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowGroup.pdxsl"
void ComputeShadow_id60(inout PS_STREAMS streams, int lightIndex)
{

    #line 12
    streams.shadowColor_id76 = 1.0f;
}

#line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/RoughnessCubeMapEnvironmentColor.pdxsl"
float4 Compute_id117(inout PS_STREAMS streams, float3 direction)
{

    #line 16

    #line 16
    float alpha = streams.alphaRoughness_id63;

    #line 17

    #line 17
    float mipLevel = sqrt(alpha) * MipCount_id158;

    #line 19
    return CubeMap_id157.SampleLevel(LinearSampler_id114, direction, mipLevel);
}

#line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SphericalHarmonicsEnvironmentColor.pdxsl"
float4 Compute_id112(float3 direction)
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
    float3 color = SphericalColors_id156[0];

    {

        #line 28
        color += SphericalColors_id156[1] * y;

        #line 29
        color += SphericalColors_id156[2] * z;

        #line 30
        color += SphericalColors_id156[3] * x;

        {

            #line 34
            color += SphericalColors_id156[4] * y * x;

            #line 35
            color += SphericalColors_id156[5] * y * z;

            #line 36
            color += SphericalColors_id156[6] * (3.0 * z2 - 1.0);

            #line 37
            color += SphericalColors_id156[7] * x * z;

            #line 38
            color += SphericalColors_id156[8] * (x2 - y2);
        }
    }

    #line 68
    return float4(color, 1);
}

#line 19 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shadows/ShadowMapReceiverDirectional.pdxsl"
void ComputeShadow_id54(inout PS_STREAMS streams, int lightIndex)
{

    #line 21
    ComputeShadow_id60(streams, lightIndex);

    #line 23

    #line 23
    int cascadeIndexBase = lightIndex * TCascadeCount_id147;

    #line 26

    #line 26
    int cascadeIndex = 0;


    #line 27
    [unroll]
    for (
#line 28

    #line 28
    int i = 0; i < TCascadeCount_id147 - 1; i++)
    {

        #line 30
        [flatten]
        if (streams.DepthVS_id20 > CascadeDepthSplits_id152[cascadeIndexBase + i])
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
    shadowPosition += GetShadowPositionOffset_id61(OffsetScales_id146[lightIndex], streams.NdotL_id43, streams.normalWS_id16);

    #line 44
    if (cascadeIndex < TCascadeCount_id147)
    {

        #line 46
        shadow = ComputeShadowFromCascade_id62(shadowPosition, cascadeIndex, lightIndex);

        #line 48

        #line 48
        float nextSplit = CascadeDepthSplits_id152[cascadeIndexBase + cascadeIndex];

        #line 49

        #line 49
        float splitSize = cascadeIndex == 0 ? nextSplit : nextSplit - CascadeDepthSplits_id152[cascadeIndexBase + cascadeIndex - 1];

        #line 50

        #line 50
        float splitDist = (nextSplit - streams.DepthVS_id20) / splitSize;

        #line 51

        #line 51
        float lerpAmt = smoothstep(0.0f, 1.0f, splitDist);

        #line 53
        if (cascadeIndex == TCascadeCount_id147 - 1)
        {
        }

        #line 60
        else 
#line 60
        if (TBlendCascades_id149)
        {

            #line 62

            #line 62
            float nextShadow = ComputeShadowFromCascade_id62(shadowPosition, cascadeIndex + 1, lightIndex);

            #line 63
            shadow = lerp(nextShadow, shadow, lerpAmt);
        }
    }

    {

        #line 77
        streams.shadowColor_id76 = shadow;
    }
}

#line 25 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightDirectionalGroup.pdxsl"
void PrepareDirectLightCore_id53(inout PS_STREAMS streams, int lightIndex)
{

    #line 27
    streams.lightColor_id39 = LightColor_id80[lightIndex];

    #line 29
    streams.lightDirectionWS_id38 = -LightDirectionsWS_id79[lightIndex];
}

#line 92 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
float GetFilterSquareRoughnessAdjustment_id86(inout PS_STREAMS streams, float3 averageNormal)
{

    #line 98

    #line 98
    float r = length(streams.matNormal_id45);

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
void ResetStream_id97()
{
}

#line 21 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceShadingDiffuseLambert.pdxsl"
float3 ComputeEnvironmentLightContribution_id127(inout PS_STREAMS streams)
{

    #line 24

    #line 24
    float3 diffuseColor = streams.matDiffuseVisible_id62;

    #line 30
    return diffuseColor * streams.envLightDiffuseColor_id41;
}

#line 18 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightSkyboxShader.pdxsl"
void PrepareEnvironmentLight_id123(inout PS_STREAMS streams)
{

    #line 20

    #line 20
    float ambientAccessibility = streams.matAmbientOcclusion_id51;

    #line 27

    #line 27
    float3 sampleDirection = mul(streams.normalWS_id16, (float3x3)SkyMatrix_id159);

    #line 28
    sampleDirection = float3(sampleDirection.xy, -sampleDirection.z);

    #line 30
    streams.envLightDiffuseColor_id41 = Compute_id112(sampleDirection).rgb * Intensity_id160 * ambientAccessibility * streams.matDiffuseSpecularAlphaBlend_id58.x;

    #line 38
    sampleDirection = reflect(-streams.viewWS_id61, streams.normalWS_id16);

    #line 39
    sampleDirection = mul(sampleDirection, (float3x3)SkyMatrix_id159);

    #line 40
    sampleDirection = float3(sampleDirection.xy, -sampleDirection.z);

    #line 42
    streams.envLightSpecularColor_id42 = Compute_id117(streams, sampleDirection).rgb * Intensity_id160 * ambientAccessibility * streams.matDiffuseSpecularAlphaBlend_id58.y;
}

#line 10 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceShadingDiffuseLambert.pdxsl"
float3 ComputeDirectLightContribution_id126(inout PS_STREAMS streams)
{

    #line 12

    #line 12
    float3 diffuseColor = streams.matDiffuseVisible_id62;

    #line 18
    return diffuseColor / PI_id166 * streams.lightColorNdotL_id40 * streams.matDiffuseSpecularAlphaBlend_id58.x;
}

#line 32 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelShadingStream.pdxsl"
void PrepareMaterialPerDirectLight_id27(inout PS_STREAMS streams)
{

    #line 36
    streams.H_id68 = normalize(streams.viewWS_id61 + streams.lightDirectionWS_id38);

    #line 38
    streams.NdotH_id69 = max(dot(streams.normalWS_id16, streams.H_id68), 0.0001f);

    #line 39
    streams.LdotH_id70 = max(dot(streams.lightDirectionWS_id38, streams.H_id68), 0.0001f);

    #line 40
    streams.VdotH_id71 = streams.LdotH_id70;
}

#line 31 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/DirectLightGroup.pdxsl"
void PrepareDirectLight_id107(inout PS_STREAMS streams, int lightIndex)
{

    #line 33
    PrepareDirectLightCore_id53(streams, lightIndex);

    #line 36
    streams.NdotL_id43 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id38), 0.0001f);

    #line 39
    ComputeShadow_id54(streams, lightIndex);

    #line 42
    streams.lightColorNdotL_id40 = streams.lightColor_id39 * streams.shadowColor_id76 * streams.NdotL_id43 * streams.lightDirectAmbientOcclusion_id44;
}

#line 23
int GetLightCount_id105()
{

    #line 25
    return LightCount_id77;
}

#line 17 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightDirectionalGroup.pdxsl"
int GetMaxLightCount_id108()
{

    #line 19
    return TMaxLightCount_id78;
}

#line 106 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
void PrepareMaterialForLightingAndShading_id96(inout PS_STREAMS streams)
{

    #line 109
    streams.lightDirectAmbientOcclusion_id44 = lerp(1.0, streams.matAmbientOcclusion_id51, streams.matAmbientOcclusionDirectLightingFactor_id52);

    #line 112
    streams.matDiffuseVisible_id62 = streams.matDiffuse_id47.rgb * lerp(1.0f, streams.matCavity_id53, streams.matCavityDiffuse_id54) * streams.matDiffuseSpecularAlphaBlend_id58.r * streams.matAlphaBlendColor_id59;

    #line 113
    streams.matSpecularVisible_id64 = streams.matSpecular_id49.rgb * streams.matSpecularIntensity_id50 * lerp(1.0f, streams.matCavity_id53, streams.matCavitySpecular_id55) * streams.matDiffuseSpecularAlphaBlend_id58.g * streams.matAlphaBlendColor_id59;

    #line 115
    streams.NdotV_id65 = max(dot(streams.normalWS_id16, streams.viewWS_id61), 0.0001f);

    #line 118

    #line 118
    float roughness = 1.0f - streams.matGlossiness_id48;

    #line 121

    #line 121
    float roughnessAdjust = GetFilterSquareRoughnessAdjustment_id86(streams, streams.matNormal_id45);

    #line 125
    streams.alphaRoughness_id63 = max(roughness * roughness + roughnessAdjust, 0.001);
}

#line 21 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Lights/LightStream.pdxsl"
void ResetLightStream_id95(inout PS_STREAMS streams)
{

    #line 23
    streams.lightDirectionWS_id38 = 0;

    #line 24
    streams.lightColor_id39 = 0;

    #line 25
    streams.lightColorNdotL_id40 = 0;

    #line 26
    streams.envLightDiffuseColor_id41 = 0;

    #line 27
    streams.envLightSpecularColor_id42 = 0;

    #line 28
    streams.lightDirectAmbientOcclusion_id44 = 1.0f;

    #line 29
    streams.NdotL_id43 = 0;
}

#line 20 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalFromMesh.pdxsl"
void UpdateNormalFromTangentSpace_id19(float3 normalInTangentSpace)
{
}

#line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/ComputeColors/Shaders/ComputeColorConstantColorLink.pdxsl"
float4 Compute_id124()
{

    #line 17
    return constantColor_id163;
}

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialStream.pdxsl"
void ResetStream_id100(inout PS_STREAMS streams)
{

    #line 14
    ResetStream_id97();

    #line 18
    streams.matBlend_id37 = 0.0f;
}

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceLightingAndShading.pdxsl"
void Compute_id164(inout PS_STREAMS streams)
{

    #line 16
    UpdateNormalFromTangentSpace_id19(streams.matNormal_id45);

    #line 19
    ResetLightStream_id95(streams);

    #line 22
    PrepareMaterialForLightingAndShading_id96(streams);

    #line 27

    #line 27
    float3 directLightingContribution = 0;

    {

        #line 30

        #line 30
        const int maxLightCount = GetMaxLightCount_id108();

        #line 31

        #line 31
        int count = GetLightCount_id105();


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
            PrepareDirectLight_id107(streams, i);

            #line 45
            PrepareMaterialPerDirectLight_id27(streams);

            {

                #line 50
                directLightingContribution += ComputeDirectLightContribution_id126(streams);
            }
        }
    }

    #line 58

    #line 58
    float3 environmentLightingContribution = 0;

    {

        #line 62
        PrepareEnvironmentLight_id123(streams);

        {

            #line 67
            environmentLightingContribution += ComputeEnvironmentLightContribution_id127(streams);
        }
    }

    #line 72
    streams.shadingColor_id66 += directLightingContribution * PI_id166 + environmentLightingContribution;

    #line 73
    streams.shadingColorAlpha_id67 = streams.matDiffuse_id47.a;
}

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceDiffuse.pdxsl"
void Compute_id149(inout PS_STREAMS streams)
{

    #line 14

    #line 14
    float4 colorBase = Compute_id124();

    #line 15
    streams.matDiffuse_id47 = colorBase;

    #line 19
    streams.matColorBase_id46 = colorBase;
}

#line 58 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelStream.pdxsl"
void ResetStream_id102(inout PS_STREAMS streams)
{

    #line 60
    ResetStream_id100(streams);

    #line 64
    streams.matNormal_id45 = float3(0, 0, 1);

    #line 66
    streams.matColorBase_id46 = 0.0f;

    #line 67
    streams.matDiffuse_id47 = 0.0f;

    #line 68
    streams.matDiffuseVisible_id62 = 0.0f;

    #line 70
    streams.matSpecular_id49 = 0.0f;

    #line 71
    streams.matSpecularVisible_id64 = 0.0f;

    #line 72
    streams.matSpecularIntensity_id50 = 1.0f;

    #line 74
    streams.matGlossiness_id48 = 0.0f;

    #line 75
    streams.alphaRoughness_id63 = 1.0f;

    #line 77
    streams.matAmbientOcclusion_id51 = 1.0f;

    #line 78
    streams.matAmbientOcclusionDirectLightingFactor_id52 = 0.0f;

    #line 80
    streams.matCavity_id53 = 1.0f;

    #line 81
    streams.matCavityDiffuse_id54 = 0.0f;

    #line 82
    streams.matCavitySpecular_id55 = 0.0f;

    #line 84
    streams.matEmissive_id56 = 0.0f;

    #line 85
    streams.matEmissiveIntensity_id57 = 0.0f;

    #line 87
    streams.matDiffuseSpecularAlphaBlend_id58 = 1.0f;

    #line 88
    streams.matAlphaBlendColor_id59 = 1.0f;

    #line 89
    streams.matAlphaDiscard_id60 = 0.0f;
}

#line 18 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationBase.pdxsl"
void PostTransformPosition_id6()
{
}

#line 12
void PreTransformPosition_id4()
{
}

#line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfaceArray.pdxsl"
void Compute_id50(inout PS_STREAMS streams)
{

    {

        #line 13
        Compute_id149(streams);
    }

    {

        #line 13
        Compute_id164(streams);
    }
}

#line 25 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialPixelShadingStream.pdxsl"
void ResetStream_id49(inout PS_STREAMS streams)
{

    #line 27
    ResetStream_id102(streams);

    #line 28
    streams.shadingColorAlpha_id67 = 1.0f;
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

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationWAndVP.pdxsl"
void PreTransformPosition_id13(inout VS_STREAMS streams)
{

    #line 10
    PreTransformPosition_id4();

    #line 11
    streams.PositionWS_id19 = mul(streams.Position_id18, World_id30);
}

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Materials/Shaders/MaterialSurfacePixelStageCompositor.pdxsl"
float4 Shading_id28(inout PS_STREAMS streams)
{

    #line 14
    streams.viewWS_id61 = normalize(Eye_id28.xyz - streams.PositionWS_id19.xyz);

    #line 15
    streams.shadingColor_id66 = 0;

    #line 18
    ResetStream_id49(streams);

    #line 22
    Compute_id50(streams);

    #line 25
    return float4(streams.shadingColor_id66, streams.shadingColorAlpha_id67);
}

#line 18 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBase.pdxsl"
void PSMain_id1()
{
}

#line 20 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationBase.pdxsl"
void BaseTransformVS_id7(inout VS_STREAMS streams)
{

    #line 22
    PreTransformPosition_id13(streams);

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
    streams.ColorTarget_id1 = Shading_id28(streams);
}

#line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalFromMesh.pdxsl"
void GenerateNormal_PS_id18(inout PS_STREAMS streams)
{

    #line 17
    streams.normalWS_id16 = normalize(streams.normalWS_id16);
}

#line 8
void GenerateNormal_VS_id17(inout VS_STREAMS streams)
{

    #line 11
    streams.normalWS_id16 = mul(streams.meshNormal_id14, (float3x3)WorldInverseTranspose_id31);
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
    streams.DepthVS_id20 = __input__.DepthVS_id20;
    streams.normalWS_id16 = __input__.normalWS_id16;

    #line 21
    GenerateNormal_PS_id18(streams);

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
    streams.meshNormal_id14 = __input__.meshNormal_id14;

    #line 10
    VSMain_id8(streams);

    #line 14
    GenerateNormal_VS_id17(streams);
    VS_OUTPUT __output__ = (VS_OUTPUT)0;
    __output__.PositionWS_id19 = streams.PositionWS_id19;
    __output__.ShadingPosition_id0 = streams.ShadingPosition_id0;
    __output__.DepthVS_id20 = streams.DepthVS_id20;
    __output__.normalWS_id16 = streams.normalWS_id16;
    return __output__;
}
