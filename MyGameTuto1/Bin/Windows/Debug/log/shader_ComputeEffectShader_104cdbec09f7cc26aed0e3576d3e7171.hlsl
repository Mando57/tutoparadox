/**************************
***** Used Parameters *****
***************************
@P EffectName: ComputeEffectShader
@P CompilerParameters.DebugKey: True
@P RadiancePrefilteringGGXParams.NbOfSamplings: 1024
@P CompilerParameters.GraphicsPlatformKey: Direct3D11
@P ComputeEffectShader.ComputeShaderName: RadiancePrefilteringGGXEffect
@P CompilerParameters.GraphicsProfileKey: Level_11_0
@P ComputeEffectShader.ThreadNumbers: X:1024 Y:1 Z:1
***************************
****  ConstantBuffers  ****
***************************
cbuffer PerDispatch [Stage: Compute, Size: 16]
@C    ThreadGroupCountGlobal_id10 => ComputeShaderBase.ThreadGroupCountGlobal
cbuffer Globals [Stage: Compute, Size: 16]
@C    RadianceMapSize_id13 => RadiancePrefilteringGGXShader.RadianceMapSize
@C    MipmapCount_id17 => RadiancePrefilteringGGXShader.MipmapCount
@C    Roughness_id18 => RadiancePrefilteringGGXShader.Roughness
***************************
******  Resources    ******
***************************
@R    LinearSampler_id19 => Texturing.LinearSampler [Stage: Compute, Slot: (0-0)]
@R    RadianceMap_id14 => RadiancePrefilteringGGXShader.RadianceMap [Stage: Compute, Slot: (0-0)]
@R    FilteredRadiance_id15 => RadiancePrefilteringGGXShader.FilteredRadiance [Stage: Compute, Slot: (0-0)]
@R    PerDispatch => PerDispatch [Stage: Compute, Slot: (0-0)]
@R    Globals => Globals [Stage: Compute, Slot: (1-1)]
***************************
*****     Sources     *****
***************************
@S    ComputeShaderBase => 999af1626cbad665ca6e6352afe69dfa
@S    RadiancePrefilteringGGXShader => 98f877f8cc56de57237798516ecb67a6
@S    Math => 26780ee7a692a8af892644c36f751ca6
@S    CubemapUtils => 67aceda7b74907b68439ad62b1860ae9
@S    Hammersley => 204f3ac3403e51f2da8b32addf24145d
@S    ImportanceSamplingGGX => 136f6d6c9f39e5ac96c33d40e3089c72
@S    BRDFMicrofacet => 79fd54c46cf048d30de23c8dd91047aa
@S    Texturing => 5a079038962447a86765b54a9ab35acb
***************************
*****     Stages      *****
***************************
@G    Compute => d9e4d02455c0385de1decadbad314c7c
***************************
*************************/

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Utils/Math.pdxsl"
static const float PI_id11 = 3.14159265358979323846;

#line 9 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/GGXPrefiltering/RadiancePrefilteringGGXShader.pdxsl"
const static int TNbOfSamples_id12 = 1024;

#line 13
TextureCube<float4> RadianceMap_id14;

#line 16
RWTexture2DArray<float4> FilteredRadiance_id15;

#line 47 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Texturing.pdxsl"
SamplerState LinearSampler_id19 
{
    Filter = MIN_MAG_MIP_LINEAR;
};
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

    #line 12 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/GGXPrefiltering/RadiancePrefilteringGGXShader.pdxsl"
    int RadianceMapSize_id13;

    #line 19
    groupshared float4 PrefilteredSamples_id16[TNbOfSamples_id12];

    #line 22
    float MipmapCount_id17;

    #line 25
    float Roughness_id18;
};

#line 65 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/ComputeShaderBase.pdxsl"
bool IsFirstThreadOfGroup_id1(inout CS_STREAMS streams)
{

    #line 67
    return streams.GroupThreadId_id2.x == 0 && streams.GroupThreadId_id2.y == 0 && streams.GroupThreadId_id2.z == 0;
}

#line 47 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/BRDF/BRDFMicrofacet.pdxsl"
float NormalDistributionGGX_id19(float alphaR, float nDotH)
{

    #line 49

    #line 49
    float alphaR2 = alphaR * alphaR;

    #line 50
    return alphaR2 / (PI_id11 * pow(max(nDotH * nDotH * (alphaR2 - 1) + 1, 0.0001), 2.0f));
}

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/GGXPrefiltering/ImportanceSamplingGGX.pdxsl"
float3 GetSample_id18(float2 xi, float roughness, float3 N)
{

    #line 13

    #line 13
    float a = roughness * roughness;

    #line 14

    #line 14
    float phi = 2 * PI_id11 * xi.x;

    #line 15

    #line 15
    float CosTheta = sqrt((1 - xi.y) / (1 + (a * a - 1) * xi.y));

    #line 16

    #line 16
    float SinTheta = sqrt(1 - CosTheta * CosTheta);

    #line 18

    #line 18
    float3 H;

    #line 19
    H.x = SinTheta * cos(phi);

    #line 20
    H.y = SinTheta * sin(phi);

    #line 21
    H.z = CosTheta;

    #line 23

    #line 23
    float3 UpVector = abs(N.z) < 0.999 ? float3(0, 0, 1) : float3(1, 0, 0);

    #line 24

    #line 24
    float3 TangentX = normalize(cross(UpVector, N));

    #line 25

    #line 25
    float3 TangentY = cross(N, TangentX);

    #line 28
    return TangentX * H.x + TangentY * H.y + N * H.z;
}

#line 11 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/GGXPrefiltering/Hammersley.pdxsl"
float2 GetSamplePlane_id17(int k, int samplesCount)
{

    #line 13

    #line 13
    float u = 0.0;

    #line 14

    #line 14
    float p = 0.5;


    #line 15
    for (
#line 15

    #line 15
    int kk = k; kk; p *= 0.5, kk >>= 1)
    {

        #line 17
        if (kk & 1)

            #line 18
            u += p;
    }

    #line 21

    #line 21
    float v = (k + 0.5) / samplesCount;

    #line 23
    return float2(u, v);
}

#line 21 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/Skyboxes/CubemapUtils.pdxsl"
float3 ConvertTexcoordsNoFlip_id16(float2 inputTexcoord, int viewIndex)
{

    #line 23

    #line 23
    float2 position = 2 * inputTexcoord - 1;

    #line 25
    if (viewIndex == 0)

        #line 26
        return float3(1, -position.y, -position.x);

    #line 27
    if (viewIndex == 1)

        #line 28
        return float3(-1, -position.y, position.x);

    #line 29
    if (viewIndex == 2)

        #line 30
        return float3(position.x, 1, position.y);

    #line 31
    if (viewIndex == 3)

        #line 32
        return float3(position.x, -1, -position.y);

    #line 33
    if (viewIndex == 4)

        #line 34
        return float3(position.x, -position.y, 1);

    #line 35
    if (viewIndex == 5)

        #line 36
        return float3(-position.x, -position.y, -1);

    #line 38
    return 0;
}

#line 28 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/GGXPrefiltering/RadiancePrefilteringGGXShader.pdxsl"
void Compute_id15(inout CS_STREAMS streams)
{

    #line 30

    #line 30
    int2 pixel = streams.GroupId_id0.xy;

    #line 31

    #line 31
    int face = streams.GroupId_id0.z;

    #line 32

    #line 32
    int threadId = streams.GroupThreadId_id2.x;

    #line 35

    #line 35
    float u = (pixel.x + 0.5) / float(streams.ThreadGroupCount_id4.x);

    #line 36

    #line 36
    float v = (pixel.y + 0.5) / float(streams.ThreadGroupCount_id4.y);

    #line 39

    #line 39
    float3 R = normalize(ConvertTexcoordsNoFlip_id16(float2(u, v), face));

    #line 42

    #line 42
    float2 xi = GetSamplePlane_id17(threadId, TNbOfSamples_id12);

    #line 43

    #line 43
    float3 H = GetSample_id18(xi, Roughness_id18, R);

    #line 45

    #line 45
    float3 L = 2 * dot(R, H) * H - R;

    #line 46

    #line 46
    float NoL = saturate(dot(R, L));

    #line 47

    #line 47
    float pdf = NormalDistributionGGX_id19(Roughness_id18 * Roughness_id18, NoL) / 4;

    #line 48

    #line 48
    float omegaS = 1.0 / (TNbOfSamples_id12 * pdf);

    #line 49

    #line 49
    float omegaP = 4.0 * PI_id11 / (6.0 * RadianceMapSize_id13 * RadianceMapSize_id13);

    #line 50

    #line 50
    float mipLevel = clamp(0.5 * log2(omegaS / omegaP), 0, MipmapCount_id17);

    #line 52

    #line 52
    float3 prefilteredColor = 0;

    #line 53

    #line 53
    float weight = 0;

    #line 54
    if (NoL > 0)
    {

        #line 56
        weight = NoL;

        #line 57
        prefilteredColor = RadianceMap_id14.SampleLevel(LinearSampler_id19, L, mipLevel).rgb * weight;
    }

    #line 61
    PrefilteredSamples_id16[threadId] = float4(prefilteredColor, weight);

    #line 62
    GroupMemoryBarrierWithGroupSync();


    #line 65
    for (
#line 65

    #line 65
    int s = TNbOfSamples_id12 / 2; s > 0; s >>= 1)
    {

        #line 67
        if (threadId < s)

            #line 68
            PrefilteredSamples_id16[threadId] += PrefilteredSamples_id16[threadId + s];

        #line 70
        GroupMemoryBarrierWithGroupSync();
    }

    #line 74
    if (IsFirstThreadOfGroup_id1(streams))
    {

        #line 76
        FilteredRadiance_id15[float3(pixel.xy, face)] = PrefilteredSamples_id16[0] / PrefilteredSamples_id16[0].w;
    }
}

#line 41 "C:/Paradox/GamePackages/Paradox.1.3.4-beta/Assets/Shared/ComputeEffect/ComputeShaderBase.pdxsl"
[numthreads(1024, 1, 1)]
void CSMain(CS_INPUT __input__)
{
    CS_STREAMS streams = (CS_STREAMS)0;
    streams.GroupId_id0 = __input__.GroupId_id0;
    streams.GroupThreadId_id2 = __input__.GroupThreadId_id2;

    #line 45
    streams.ThreadCountX_id7 = 1024;

    #line 46
    streams.ThreadCountY_id8 = 1;

    #line 47
    streams.ThreadCountZ_id9 = 1;

    #line 50
    streams.ThreadCountPerGroup_id5 = 1024 * 1 * 1;

    #line 53
    streams.ThreadGroupCount_id4 = ThreadGroupCountGlobal_id10;

    #line 56
    streams.ThreadGroupIndex_id6 = (streams.GroupId_id0.z * streams.ThreadGroupCount_id4.y + streams.GroupId_id0.y) * streams.ThreadGroupCount_id4.x + streams.GroupId_id0.x;

    #line 58
    Compute_id15(streams);
}
