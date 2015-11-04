/**************************
***** Used Parameters *****
***************************
@P EffectName: ParadoxForwardShadingEffect.ShadowMapCaster
@P CompilerParameters.DebugKey: True
@P Material.HasSkinningTangent: False
@P Material.HasNormalMap: True
@P Material.HasSkinningPosition: True
@P Material.HasSkinningNormal: True
@P ParadoxEffectBase.ExtensionPostVertexStageShader: pdxfx ShadowMapCaster
@P Material.TessellationShader: null
@P Material.SkinningBones: 16
@P CompilerParameters.GraphicsPlatformKey: Direct3D11
@P Material.SkinningMaxBones: 56
@P CompilerParameters.GraphicsProfileKey: Level_10_0
@P Material.VertexStageSurfaceShaders: null
***************************
****  ConstantBuffers  ****
***************************
cbuffer PerFrame [Stage: Vertex, Size: 64]
@C    ViewProjection_id26 => Transformation.ViewProjection
cbuffer Globals [Stage: Vertex, Size: 3584]
@C    BlendMatrixArray_id37 => TransformationSkinning.BlendMatrixArray
***************************
******  Resources    ******
***************************
@R    PerFrame => PerFrame [Stage: Vertex, Slot: (0-0)]
@R    Globals => Globals [Stage: Vertex, Slot: (1-1)]
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
@S    ShadowMapCasterBase => 627880aa8d75c7604b65dc7a70076569
@S    PositionStream => de40f77d9beb7d24178d0673b1c68081
***************************
*****     Stages      *****
***************************
@G    Vertex => 4447e75cb5dedb8cf6663c53024dd8b6
***************************
*************************/
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

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float4 PositionWS_id19;

    #line 31 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/TransformationSkinning.pdxsl"
    float4x4 skinningBlendMatrix_id40;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBaseStream.pdxsl"
    float4 ShadingPosition_id0;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionHStream4.pdxsl"
    float4 PositionH_id21;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float DepthVS_id20;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 normalWS_id16;
};
struct VS_OUTPUT 
{

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float4 PositionWS_id19 : POSITION_WS;

    #line 31 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/TransformationSkinning.pdxsl"
    float4x4 skinningBlendMatrix_id40 : SKINNINGBLENDMATRIX_ID40_SEM;

    #line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 meshNormal_id14 : NORMAL;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBaseStream.pdxsl"
    float4 ShadingPosition_id0 : SV_Position;

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionHStream4.pdxsl"
    float4 PositionH_id21 : POSITIONH;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/PositionStream4.pdxsl"
    float DepthVS_id20 : DEPTH_VS;

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalStream.pdxsl"
    float3 normalWS_id16 : NORMALWS;
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
};
cbuffer PerFrame 
{

    #line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Shaders/Transformation.pdxsl"
    float4x4 ViewProjection_id26;
};
cbuffer PerObject 
{

    #line 26
    float4x4 World_id30;
};
cbuffer Globals 
{

    #line 21 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/TransformationSkinning.pdxsl"
    float4x4 BlendMatrixArray_id37[56];
};

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationBase.pdxsl"
void PreTransformPosition_id4()
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

#line 18 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationBase.pdxsl"
void PostTransformPosition_id6()
{
}

#line 33 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skinning/TransformationSkinning.pdxsl"
void PreTransformPosition_id20(inout VS_STREAMS streams)
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
void PreTransformPosition_id21(inout VS_STREAMS streams)
{

    #line 10
    PreTransformPosition_id20(streams);

    #line 11
    streams.meshNormal_id14 = normalize(mul(streams.meshNormal_id14, (float3x3)streams.skinningBlendMatrix_id40));
}

#line 20 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Transformation/TransformationBase.pdxsl"
void BaseTransformVS_id7(inout VS_STREAMS streams)
{

    #line 22
    PreTransformPosition_id21(streams);

    #line 23
    TransformPosition_id5();

    #line 24
    PostTransformPosition_id14(streams);
}

#line 15 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ShaderBase.pdxsl"
void VSMain_id0()
{
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

#line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Core/NormalBase.pdxsl"
VS_OUTPUT VSMain(VS_INPUT __input__)
{
    VS_STREAMS streams = (VS_STREAMS)0;
    streams.Position_id18 = __input__.Position_id18;
    streams.BlendIndices_id39 = __input__.BlendIndices_id39;
    streams.BlendWeights_id38 = __input__.BlendWeights_id38;
    streams.meshNormal_id14 = __input__.meshNormal_id14;

    #line 10
    VSMain_id8(streams);

    #line 14
    GenerateNormal_VS_id15(streams);
    VS_OUTPUT __output__ = (VS_OUTPUT)0;
    __output__.PositionWS_id19 = streams.PositionWS_id19;
    __output__.skinningBlendMatrix_id40 = streams.skinningBlendMatrix_id40;
    __output__.meshNormal_id14 = streams.meshNormal_id14;
    __output__.ShadingPosition_id0 = streams.ShadingPosition_id0;
    __output__.PositionH_id21 = streams.PositionH_id21;
    __output__.DepthVS_id20 = streams.DepthVS_id20;
    __output__.normalWS_id16 = streams.normalWS_id16;
    return __output__;
}
