/**************************
***** Used Parameters *****
***************************
@P EffectName: DepthMinMaxEffect
@P CompilerParameters.DebugKey: True
@P CompilerParameters.GraphicsPlatformKey: Direct3D11
@P DepthMinMax.IsFirstPassKey: False
@P CompilerParameters.GraphicsProfileKey: Level_10_0
***************************
****  ConstantBuffers  ****
***************************
cbuffer Globals [Stage: Vertex, Size: 64]
@C    MatrixTransform_id72 => SpriteBase.MatrixTransform
***************************
******  Resources    ******
***************************
@R    Globals => Globals [Stage: Vertex, Slot: (0-0)]
@R    PointSampler_id42 => Texturing.PointSampler [Stage: Pixel, Slot: (0-0)]
@R    TextureReduction_id75 => DepthMinMaxShader.TextureReduction [Stage: Pixel, Slot: (0-0)]
***************************
*****     Sources     *****
***************************
@S    DepthMinMaxShader => d3f709e02f54f267815e5cb61b00701a
@S    ImageEffectShader => a553db2bbbb04c0cc9d8a98911d6c20a
@S    SpriteBase => 1d223aa489256870663eab5bdef0b88d
@S    ShaderBase => a82f902571734048b947e14b869afff5
@S    ShaderBaseStream => fc958f25c75bed221fe8c243536b9d86
@S    Texturing => 5a079038962447a86765b54a9ab35acb
***************************
*****     Stages      *****
***************************
@G    Vertex => 7b8af58dd24be2684728cc0b8599ce6f
@G    Pixel => 282adf726ff16f480990070f1daad7d9
***************************
*************************/

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Images/DepthMinMax/DepthMinMaxShader.pdxsl"
const static bool TFirstPass_id73 = false;

#line 42 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
SamplerState PointSampler_id42 
{
    Filter = MIN_MAG_MIP_POINT;
};

#line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Images/DepthMinMax/DepthMinMaxShader.pdxsl"
Texture2D<float> TextureMap_id74;

#line 15
Texture2D<float2> TextureReduction_id75;
struct PS_STREAMS 
{

    #line 114 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
    float2 TexCoord_id61;

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
};
struct VS_OUTPUT 
{

    #line 8
    float4 ShadingPosition_id0 : SV_Position;

    #line 114 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
    float2 TexCoord_id61 : TEXCOORD0;
};
struct VS_INPUT 
{

    #line 8 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/SpriteBase.pdxsl"
    float4 Position_id71 : POSITION;

    #line 114 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
    float2 TexCoord_id61 : TEXCOORD0;
};
cbuffer Globals 
{

    #line 14 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/SpriteBase.pdxsl"
    float4x4 MatrixTransform_id72;
};

#line 18 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Images/DepthMinMax/DepthMinMaxShader.pdxsl"
float max_not_1_id3(float left, float right)
{

    #line 20
    if (left == 1.0f)

        #line 20
        return right;

    #line 21
    if (right == 1.0f)

        #line 21
        return left;

    #line 22
    return max(left, right);
}

#line 25
float4 Shading_id4(inout PS_STREAMS streams)
{

    {

        #line 47

        #line 47
        float4 
#line 47
        minValues, 
#line 47
        maxValues;

        #line 53
        minValues.x = TextureReduction_id75.Sample(PointSampler_id42, streams.TexCoord_id61, int2(0, 1)).r;

        #line 54
        minValues.y = TextureReduction_id75.Sample(PointSampler_id42, streams.TexCoord_id61, int2(1, 1)).r;

        #line 55
        minValues.z = TextureReduction_id75.Sample(PointSampler_id42, streams.TexCoord_id61, int2(1, 0)).r;

        #line 56
        minValues.w = TextureReduction_id75.Sample(PointSampler_id42, streams.TexCoord_id61, int2(0, 0)).r;

        #line 58
        maxValues.x = TextureReduction_id75.Sample(PointSampler_id42, streams.TexCoord_id61, int2(0, 1)).g;

        #line 59
        maxValues.y = TextureReduction_id75.Sample(PointSampler_id42, streams.TexCoord_id61, int2(1, 1)).g;

        #line 60
        maxValues.z = TextureReduction_id75.Sample(PointSampler_id42, streams.TexCoord_id61, int2(1, 0)).g;

        #line 61
        maxValues.w = TextureReduction_id75.Sample(PointSampler_id42, streams.TexCoord_id61, int2(0, 0)).g;

        #line 65

        #line 65
        float minValue = min(min(minValues[0], minValues[1]), min(minValues[2], minValues[3]));

        #line 66

        #line 66
        float maxValue = max_not_1_id3(max_not_1_id3(maxValues[0], maxValues[1]), max_not_1_id3(maxValues[2], maxValues[3]));

        #line 68
        return float4(minValue, maxValue, 0, 0);
    }
}

#line 25 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/SpriteBase.pdxsl"
PS_OUTPUT PSMain(VS_OUTPUT __input__)
{
    PS_STREAMS streams = (PS_STREAMS)0;
    streams.TexCoord_id61 = __input__.TexCoord_id61;

    #line 27
    streams.ColorTarget_id1 = Shading_id4(streams);
    PS_OUTPUT __output__ = (PS_OUTPUT)0;
    __output__.ColorTarget_id1 = streams.ColorTarget_id1;
    return __output__;
}

#line 19
VS_OUTPUT VSMain(VS_INPUT __input__)
{
    VS_STREAMS streams = (VS_STREAMS)0;
    streams.Position_id71 = __input__.Position_id71;
    streams.TexCoord_id61 = __input__.TexCoord_id61;

    #line 21
    streams.ShadingPosition_id0 = mul(streams.Position_id71, MatrixTransform_id72);
    VS_OUTPUT __output__ = (VS_OUTPUT)0;
    __output__.ShadingPosition_id0 = streams.ShadingPosition_id0;
    __output__.TexCoord_id61 = streams.TexCoord_id61;
    return __output__;
}
