/**************************
***** Used Parameters *****
***************************
@P EffectName: SkyboxEffect
@P CompilerParameters.DebugKey: True
@P Skybox.Shader: ComputeSkyboxCubeMapColor<Skybox.CubeMap>
@P CompilerParameters.GraphicsPlatformKey: Direct3D11
@P CompilerParameters.GraphicsProfileKey: Level_10_0
***************************
****  ConstantBuffers  ****
***************************
cbuffer PerFrame [Stage: Vertex, Size: 128]
@C    ViewInverse_id74 => Transformation.ViewInverse
@C    ProjectionInverse_id76 => Transformation.ProjectionInverse
cbuffer Globals [Stage: Vertex, Size: 144]
@C    MatrixTransform_id72 => SpriteBase.MatrixTransform
@C    Intensity_id89 => Skybox.Intensity
@C    SkyMatrix_id90 => Skybox.SkyMatrix
cbuffer Globals [Stage: Pixel, Size: 144]
@C    MatrixTransform_id72 => SpriteBase.MatrixTransform
@C    Intensity_id89 => Skybox.Intensity
@C    SkyMatrix_id90 => Skybox.SkyMatrix
***************************
******  Resources    ******
***************************
@R    PerFrame => PerFrame [Stage: Vertex, Slot: (0-0)]
@R    Globals => Globals [Stage: Vertex, Slot: (1-1)]
@R    LinearSampler_id43 => Texturing.LinearSampler [Stage: Pixel, Slot: (0-0)]
@R    CubeMap_id92 => Skybox.CubeMap [Stage: Pixel, Slot: (0-0)]
@R    Globals => Globals [Stage: Pixel, Slot: (0-0)]
***************************
*****     Sources     *****
***************************
@S    SkyboxShader => 6099893c7adc89326d6d8113f04131af
@S    ImageEffectShader => a553db2bbbb04c0cc9d8a98911d6c20a
@S    SpriteBase => 1d223aa489256870663eab5bdef0b88d
@S    ShaderBase => a82f902571734048b947e14b869afff5
@S    ShaderBaseStream => fc958f25c75bed221fe8c243536b9d86
@S    Texturing => 5a079038962447a86765b54a9ab35acb
@S    Transformation => 75adce3fafe5e2761c867d07ad2aa6bf
@S    SkyboxStream => ceaa081b44d0704fddb30a081083f2bd
@S    IComputeEnvironmentColor => 31d6025d2a2e89eaea8b109be1e7f195
@S    ComputeSkyboxCubeMapColor => eddcad96e571bb0700e92b7e7c486c30
@S    DynamicTextureCube => 9da6e25582a9594471e5f7e0a176c842
***************************
*****     Stages      *****
***************************
@G    Vertex => dcc4675af62bf3efd8cc3fb5a04aaa45
@G    Pixel => 56028d41eafe24cd2a52deec55e55985
***************************
*************************/

#line 47 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
SamplerState LinearSampler_id43 
{
    Filter = MIN_MAG_MIP_LINEAR;
};

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/DynamicTextureCube.pdxsl"
TextureCube CubeMap_id92;
struct PS_STREAMS 
{

    #line 7 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SkyboxStream.pdxsl"
    float3 skyboxViewDirection_id88;

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

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/SpriteBase.pdxsl"
    float4 Position_id71;

    #line 114 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
    float2 TexCoord_id61;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBaseStream.pdxsl"
    float4 ShadingPosition_id0;

    #line 7 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SkyboxStream.pdxsl"
    float3 skyboxViewDirection_id88;
};
struct VS_OUTPUT 
{

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBaseStream.pdxsl"
    float4 ShadingPosition_id0 : SV_Position;

    #line 7 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SkyboxStream.pdxsl"
    float3 skyboxViewDirection_id88 : SKYBOXVIEWDIRECTION_ID88_SEM;
};
struct VS_INPUT 
{

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/SpriteBase.pdxsl"
    float4 Position_id71 : POSITION;

    #line 114 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
    float2 TexCoord_id61 : TEXCOORD0;
};
cbuffer PerFrame 
{

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shaders/Transformation.pdxsl"
    float4x4 ViewInverse_id74;

    #line 13
    float4x4 ProjectionInverse_id76;
};
cbuffer PerObject 
{
};
cbuffer Globals 
{

    #line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/SpriteBase.pdxsl"
    float4x4 MatrixTransform_id72;

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SkyboxShader.pdxsl"
    float Intensity_id89;

    #line 15
    float4x4 SkyMatrix_id90;
};

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/ComputeSkyboxCubeMapColor.pdxsl"
float4 Compute_id5(float3 direction)
{

    #line 13
    return CubeMap_id92.Sample(LinearSampler_id43, direction);
}

#line 28 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SkyboxShader.pdxsl"
float4 Shading_id4(inout PS_STREAMS streams)
{

    #line 30

    #line 30
    float3 samplingDir = normalize(streams.skyboxViewDirection_id88);

    #line 31

    #line 31
    float3 color = Compute_id5(float3(samplingDir.x, samplingDir.y, -samplingDir.z)).rgb;

    #line 32
    return float4(color * Intensity_id89, 1.0);
}

#line 19 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/SpriteBase.pdxsl"
void VSMain_id2(inout VS_STREAMS streams)
{

    #line 21
    streams.ShadingPosition_id0 = mul(streams.Position_id71, MatrixTransform_id72);
}

#line 25
PS_OUTPUT PSMain(VS_OUTPUT __input__)
{
    PS_STREAMS streams = (PS_STREAMS)0;
    streams.skyboxViewDirection_id88 = __input__.skyboxViewDirection_id88;

    #line 27
    streams.ColorTarget_id1 = Shading_id4(streams);
    PS_OUTPUT __output__ = (PS_OUTPUT)0;
    __output__.ColorTarget_id1 = streams.ColorTarget_id1;
    return __output__;
}

#line 19 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/SkyboxShader.pdxsl"
VS_OUTPUT VSMain(VS_INPUT __input__)
{
    VS_STREAMS streams = (VS_STREAMS)0;
    streams.Position_id71 = __input__.Position_id71;
    streams.TexCoord_id61 = __input__.TexCoord_id61;

    #line 21
    VSMain_id2(streams);

    #line 22

    #line 22
    float4 position = float4(streams.TexCoord_id61.x * 2 - 1, 1 - streams.TexCoord_id61.y * 2, 1.0f, 1.0f);

    #line 23

    #line 23
    float3 directionVS = mul(position, ProjectionInverse_id76).xyz;

    #line 24

    #line 24
    float3 directionWS = mul(directionVS, (float3x3)ViewInverse_id74);

    #line 25
    streams.skyboxViewDirection_id88 = mul(directionWS, (float3x3)SkyMatrix_id90);
    VS_OUTPUT __output__ = (VS_OUTPUT)0;
    __output__.ShadingPosition_id0 = streams.ShadingPosition_id0;
    __output__.skyboxViewDirection_id88 = streams.skyboxViewDirection_id88;
    return __output__;
}
