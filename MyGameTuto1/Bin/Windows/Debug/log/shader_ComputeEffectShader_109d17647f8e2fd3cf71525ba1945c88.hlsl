/**************************
***** Used Parameters *****
***************************
@P EffectName: ComputeEffectShader
@P CompilerParameters.DebugKey: True
@P SphericalHarmonicsParameters.HarmonicsOrder: 3
@P CompilerParameters.GraphicsPlatformKey: Direct3D11
@P LambertianPrefilteringSHParameters.BlockSize: 4
@P ComputeEffectShader.ComputeShaderName: LambertianPrefilteringSHEffectPass1
@P CompilerParameters.GraphicsProfileKey: Level_11_0
@P ComputeEffectShader.ThreadNumbers: X:4 Y:4 Z:1
***************************
****  ConstantBuffers  ****
***************************
cbuffer PerDispatch [Stage: Compute, Size: 16]
@C    ThreadGroupCountGlobal_id10 => ComputeShaderBase.ThreadGroupCountGlobal
***************************
******  Resources    ******
***************************
@R    PointSampler_id48 => Texturing.PointSampler [Stage: Compute, Slot: (0-0)]
@R    RadianceMap_id79 => LambertianPrefilteringSHPass1.RadianceMap [Stage: Compute, Slot: (0-0)]
@R    OutputBuffer_id80 => LambertianPrefilteringSHPass1.OutputBuffer [Stage: Compute, Slot: (0-0)]
@R    PerDispatch => PerDispatch [Stage: Compute, Slot: (0-0)]
***************************
*****     Sources     *****
***************************
@S    ComputeShaderBase => 999af1626cbad665ca6e6352afe69dfa
@S    LambertianPrefilteringSHPass1 => 4df727725eef66196b3c413c04107060
@S    Texturing => 5a079038962447a86765b54a9ab35acb
@S    SphericalHarmonicsBase => e63980b1a9be34d45f6f7ad97665bd1c
@S    Math => 26780ee7a692a8af892644c36f751ca6
***************************
*****     Stages      *****
***************************
@G    Compute => 2d71e110c5ef71367d283269f88e4db5
***************************
*************************/

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Utils/Math.pdxsl"
static const float PI_id11 = 3.14159265358979323846;

#line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Images/SphericalHarmonics/SphericalHarmonicsBase.pdxsl"
const static int TOrder_id12 = 3;

#line 11
static const int CoefficientsCount_id13 = TOrder_id12 * TOrder_id12;

#line 14
static const float PI4_id14 = 4 * PI_id11;

#line 15
static const float PI16_id15 = 16 * PI_id11;

#line 16
static const float PI64_id16 = 64 * PI_id11;

#line 17
static const float SQRT_PI_id17 = 1.77245385090551602729;

#line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/LambertianPrefiltering/LambertianPrefilteringSHPass1.pdxsl"
const static int TBlockSize_id77 = 4;

#line 18
static const float A0_id81 = 1.0;

#line 19
static const float A1_id82 = 2.0 / 3.0;

#line 20
static const float A2_id83 = 1.0 / 4.0;

#line 21
static const float A3_id84 = 0.0;

#line 22
static const float A4_id85 = -1.0 / 24.0;

#line 23
static const float A_id86[5 * 5] = { A0_id81, A1_id82, A1_id82, A1_id82, A2_id83, A2_id83, A2_id83, A2_id83, A2_id83, A3_id84, A3_id84, A3_id84, A3_id84, A3_id84, A3_id84, A3_id84, A4_id85, A4_id85, A4_id85, A4_id85, A4_id85, A4_id85, A4_id85, A4_id85, A4_id85};

#line 42 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
SamplerState PointSampler_id48 
{
    Filter = MIN_MAG_MIP_POINT;
};

#line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/LambertianPrefiltering/LambertianPrefilteringSHPass1.pdxsl"
TextureCube<float4> RadianceMap_id79;

#line 15
RWBuffer<float4> OutputBuffer_id80;
struct CS_STREAMS 
{

    #line 22 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/ComputeShaderBase.pdxsl"
    uint3 GroupId_id0;

    #line 24
    uint3 GroupThreadId_id2;

    #line 31
    int ThreadCountX_id7;

    #line 32
    int ThreadCountY_id8;

    #line 33
    int ThreadCountZ_id9;

    #line 28
    uint ThreadCountPerGroup_id5;

    #line 27
    uint3 ThreadGroupCount_id4;

    #line 29
    uint ThreadGroupIndex_id6;

    #line 20 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Images/SphericalHarmonics/SphericalHarmonicsBase.pdxsl"
    float SHBaseValues_id18[CoefficientsCount_id13];
};
struct CS_INPUT 
{

    #line 22 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/ComputeShaderBase.pdxsl"
    uint3 GroupId_id0 : SV_GroupID;

    #line 24
    uint3 GroupThreadId_id2 : SV_GroupThreadID;
};
cbuffer PerDispatch 
{

    #line 38
    int3 ThreadGroupCountGlobal_id10;
};
cbuffer Globals 
{

    #line 33 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/LambertianPrefiltering/LambertianPrefilteringSHPass1.pdxsl"
    groupshared float4 PartialSHCoeffs_id87[TBlockSize_id77][TBlockSize_id77][CoefficientsCount_id13];
};

#line 65 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/ComputeShaderBase.pdxsl"
bool IsFirstThreadOfGroup_id1(inout CS_STREAMS streams)
{

    #line 67
    return streams.GroupThreadId_id2.x == 0 && streams.GroupThreadId_id2.y == 0 && streams.GroupThreadId_id2.z == 0;
}

#line 22 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Images/SphericalHarmonics/SphericalHarmonicsBase.pdxsl"
void EvaluateSHBases_id15(inout CS_STREAMS streams, float3 direction)
{

    #line 24

    #line 24
    float x = direction.x;

    #line 25

    #line 25
    float y = direction.y;

    #line 26

    #line 26
    float z = direction.z;

    #line 28

    #line 28
    float x2 = x * x;

    #line 29

    #line 29
    float y2 = y * y;

    #line 30

    #line 30
    float z2 = z * z;

    #line 32
    streams.SHBaseValues_id18[0] = 1.0 / (2.0 * SQRT_PI_id17);

    {

        #line 36
        streams.SHBaseValues_id18[1] = -sqrt(3.0 / PI4_id14) * y;

        #line 37
        streams.SHBaseValues_id18[2] = sqrt(3.0 / PI4_id14) * z;

        #line 38
        streams.SHBaseValues_id18[3] = -sqrt(3.0 / PI4_id14) * x;

        {

            #line 42
            streams.SHBaseValues_id18[4] = sqrt(15.0 / PI4_id14) * y * x;

            #line 43
            streams.SHBaseValues_id18[5] = -sqrt(15.0 / PI4_id14) * y * z;

            #line 44
            streams.SHBaseValues_id18[6] = sqrt(5.0 / PI16_id15) * (3.0 * z2 - 1.0);

            #line 45
            streams.SHBaseValues_id18[7] = -sqrt(15.0 / PI4_id14) * x * z;

            #line 46
            streams.SHBaseValues_id18[8] = sqrt(15.0 / PI16_id15) * (x2 - y2);
        }
    }
}

#line 107 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/LambertianPrefiltering/LambertianPrefilteringSHPass1.pdxsl"
float3 uvToDirectionVS_id16(float u, float v, int viewIndex)
{

    #line 109
    if (viewIndex == 0)

        #line 110
        return float3(1, -v, -u);

    #line 111
    if (viewIndex == 1)

        #line 112
        return float3(-1, -v, u);

    #line 113
    if (viewIndex == 2)

        #line 114
        return float3(u, 1, v);

    #line 115
    if (viewIndex == 3)

        #line 116
        return float3(u, -1, -v);

    #line 117
    if (viewIndex == 4)

        #line 118
        return float3(u, -v, 1);

    #line 119
    if (viewIndex == 5)

        #line 120
        return float3(-u, -v, -1);

    #line 122
    return 0;
}

#line 36
void Compute_id17(inout CS_STREAMS streams)
{

    #line 39

    #line 39
    const int3 location = int3(streams.GroupThreadId_id2.xy + streams.GroupId_id0.xy * TBlockSize_id77, streams.GroupId_id0.z);

    #line 42

    #line 42
    float inverseSize = 1 / float(TBlockSize_id77 * streams.ThreadGroupCount_id4.x);

    #line 43

    #line 43
    float u = ((location.x + 0.5) * inverseSize) * 2.0f - 1.0f;

    #line 44

    #line 44
    float v = ((location.y + 0.5) * inverseSize) * 2.0f - 1.0f;

    #line 47

    #line 47
    float3 dirVS = normalize(uvToDirectionVS_id16(u, v, location.z));

    #line 48

    #line 48
    float3 radiance = RadianceMap_id79.SampleLevel(PointSampler_id48, dirVS, 0).xyz;

    #line 51

    #line 51
    float dist = 1.0f + u * u + v * v;

    #line 52

    #line 52
    float weight = 4.0f / (sqrt(dist) * dist);

    #line 53
    radiance *= weight;

    #line 56
    EvaluateSHBases_id15(streams, dirVS);


    #line 59
    [unroll]
    for (
#line 60

    #line 60
    int c = 0; c < CoefficientsCount_id13; ++c)
    {

        #line 62
        PartialSHCoeffs_id87[streams.GroupThreadId_id2.x][streams.GroupThreadId_id2.y][c] = float4(A_id86[c] * streams.SHBaseValues_id18[c] * radiance, weight);
    }

    #line 64
    GroupMemoryBarrierWithGroupSync();

    #line 67
    if (streams.GroupThreadId_id2.y == 0)
    {


        #line 69
        for (
#line 69

        #line 69
        int col = 1; col < TBlockSize_id77; ++col)
        {


            #line 71
            [unroll]
            for (
#line 72

            #line 72
            int c = 0; c < CoefficientsCount_id13; ++c)
            {

                #line 74
                PartialSHCoeffs_id87[0][streams.GroupThreadId_id2.x][c] += PartialSHCoeffs_id87[col][streams.GroupThreadId_id2.x][c];
            }
        }
    }

    #line 78
    GroupMemoryBarrierWithGroupSync();

    #line 81
    if (IsFirstThreadOfGroup_id1(streams))
    {


        #line 83
        for (
#line 83

        #line 83
        int r = 1; r < TBlockSize_id77; ++r)
        {


            #line 85
            [unroll]
            for (
#line 86

            #line 86
            int c = 0; c < CoefficientsCount_id13; ++c)
            {

                #line 88
                PartialSHCoeffs_id87[0][0][c] += PartialSHCoeffs_id87[0][r][c];
            }
        }
    }

    #line 94
    if (IsFirstThreadOfGroup_id1(streams))
    {

        #line 96

        #line 96
        int2 groupCount = streams.ThreadGroupCount_id4.xy;

        #line 97

        #line 97
        int indexBias = CoefficientsCount_id13 * (streams.GroupId_id0.x + streams.GroupId_id0.y * groupCount.x + groupCount.x * groupCount.y * location.z);


        #line 99
        [unroll]
        for (
#line 100

        #line 100
        int c = 0; c < CoefficientsCount_id13; ++c)
        {

            #line 102
            OutputBuffer_id80[indexBias + c] = PartialSHCoeffs_id87[0][0][c];
        }
    }
}

#line 41 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/ComputeShaderBase.pdxsl"
[numthreads(4, 4, 1)]
void CSMain(CS_INPUT __input__)
{
    CS_STREAMS streams = (CS_STREAMS)0;
    streams.GroupId_id0 = __input__.GroupId_id0;
    streams.GroupThreadId_id2 = __input__.GroupThreadId_id2;

    #line 45
    streams.ThreadCountX_id7 = 4;

    #line 46
    streams.ThreadCountY_id8 = 4;

    #line 47
    streams.ThreadCountZ_id9 = 1;

    #line 50
    streams.ThreadCountPerGroup_id5 = 4 * 4 * 1;

    #line 53
    streams.ThreadGroupCount_id4 = ThreadGroupCountGlobal_id10;

    #line 56
    streams.ThreadGroupIndex_id6 = (streams.GroupId_id0.z * streams.ThreadGroupCount_id4.y + streams.GroupId_id0.y) * streams.ThreadGroupCount_id4.x + streams.GroupId_id0.x;

    #line 58
    Compute_id17(streams);
}
