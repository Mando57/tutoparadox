/**************************
***** Used Parameters *****
***************************
@P EffectName: ComputeEffectShader
@P CompilerParameters.DebugKey: True
@P SphericalHarmonicsParameters.HarmonicsOrder: 3
@P CompilerParameters.GraphicsPlatformKey: Direct3D11
@P LambertianPrefilteringSHParameters.BlockSize: 2
@P ComputeEffectShader.ComputeShaderName: LambertianPrefilteringSHEffectPass2
@P CompilerParameters.GraphicsProfileKey: Level_11_0
@P ComputeEffectShader.ThreadNumbers: X:2 Y:1 Z:1
***************************
****  ConstantBuffers  ****
***************************
cbuffer PerDispatch [Stage: Compute, Size: 16]
@C    ThreadGroupCountGlobal_id10 => ComputeShaderBase.ThreadGroupCountGlobal
***************************
******  Resources    ******
***************************
@R    InputBuffer_id79 => LambertianPrefilteringSHPass2.InputBuffer [Stage: Compute, Slot: (0-0)]
@R    OutputBuffer_id80 => LambertianPrefilteringSHPass2.OutputBuffer [Stage: Compute, Slot: (0-0)]
@R    PerDispatch => PerDispatch [Stage: Compute, Slot: (0-0)]
***************************
*****     Sources     *****
***************************
@S    ComputeShaderBase => 999af1626cbad665ca6e6352afe69dfa
@S    LambertianPrefilteringSHPass2 => 6b681c82faa617d916a0fe4465e335e9
@S    Texturing => 5a079038962447a86765b54a9ab35acb
@S    Math => 26780ee7a692a8af892644c36f751ca6
@S    SphericalHarmonicsBase => e63980b1a9be34d45f6f7ad97665bd1c
***************************
*****     Stages      *****
***************************
@G    Compute => 41c91ae32f4884e5b801019909b644b7
***************************
*************************/

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Utils/Math.pdxsl"
static const float PI_id11 = 3.14159265358979323846;

#line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Images/SphericalHarmonics/SphericalHarmonicsBase.pdxsl"
const static int TOrder_id12 = 3;

#line 11
static const int CoefficientsCount_id13 = TOrder_id12 * TOrder_id12;

#line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/LambertianPrefiltering/LambertianPrefilteringSHPass2.pdxsl"
const static int TSize_id77 = 2;

#line 12
Buffer<float4> InputBuffer_id79;

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
};
struct CS_INPUT 
{

    #line 22
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

    #line 18 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/LambertianPrefiltering/LambertianPrefilteringSHPass2.pdxsl"
    groupshared float4 PartialSHCoeffs_id81[TSize_id77];
};

#line 65 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/ComputeShaderBase.pdxsl"
bool IsFirstThreadOfGroup_id1(inout CS_STREAMS streams)
{

    #line 67
    return streams.GroupThreadId_id2.x == 0 && streams.GroupThreadId_id2.y == 0 && streams.GroupThreadId_id2.z == 0;
}

#line 21 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/LambertianPrefiltering/LambertianPrefilteringSHPass2.pdxsl"
void Compute_id16(inout CS_STREAMS streams)
{

    #line 23

    #line 23
    int coeffId = streams.GroupId_id0.z;

    #line 24

    #line 24
    int threadId = streams.GroupThreadId_id2.x;

    #line 25

    #line 25
    int groupId = streams.GroupId_id0.x + streams.ThreadGroupCount_id4.x * streams.GroupId_id0.y;

    #line 28
    PartialSHCoeffs_id81[threadId] = InputBuffer_id79[coeffId + CoefficientsCount_id13 * (threadId + TSize_id77 * groupId)];

    #line 29
    GroupMemoryBarrierWithGroupSync();


    #line 32
    for (
#line 32

    #line 32
    int s = TSize_id77 / 2; s > 0; s >>= 1)
    {

        #line 34
        if (threadId < s)

            #line 35
            PartialSHCoeffs_id81[threadId] += PartialSHCoeffs_id81[threadId + s];

        #line 37
        GroupMemoryBarrierWithGroupSync();
    }

    #line 41
    if (IsFirstThreadOfGroup_id1(streams))
    {

        #line 43
        OutputBuffer_id80[coeffId + CoefficientsCount_id13 * groupId] = PartialSHCoeffs_id81[0];
    }
}

#line 41 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/ComputeShaderBase.pdxsl"
[numthreads(2, 1, 1)]
void CSMain(CS_INPUT __input__)
{
    CS_STREAMS streams = (CS_STREAMS)0;
    streams.GroupId_id0 = __input__.GroupId_id0;
    streams.GroupThreadId_id2 = __input__.GroupThreadId_id2;

    #line 45
    streams.ThreadCountX_id7 = 2;

    #line 46
    streams.ThreadCountY_id8 = 1;

    #line 47
    streams.ThreadCountZ_id9 = 1;

    #line 50
    streams.ThreadCountPerGroup_id5 = 2 * 1 * 1;

    #line 53
    streams.ThreadGroupCount_id4 = ThreadGroupCountGlobal_id10;

    #line 56
    streams.ThreadGroupIndex_id6 = (streams.GroupId_id0.z * streams.ThreadGroupCount_id4.y + streams.GroupId_id0.y) * streams.ThreadGroupCount_id4.x + streams.GroupId_id0.x;

    #line 58
    Compute_id16(streams);
}
