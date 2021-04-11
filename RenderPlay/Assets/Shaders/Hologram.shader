Shader "Custom/Hologram"
{
    Properties
    {
        _rimColor("Rim Color",Color) = (1,1,1,1)
        _rimPower("Rim Power",Range(0.5,8)) = 1
    }

    SubShader
    {
        Tags{
            "Queue" = "Transparent"
        }

        Pass
        {
            ZWrite On
            ColorMask 0
        }

        CGPROGRAM
        #pragma surface surf Lambert alpha:fade

        struct Input
        {
            float2 uv_MainTex;
            float3 viewDir;
            float3 worldPos;
        };
        
        float4 _rimColor;
        float _rimPower;
        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1- saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = _rimColor * pow(rim,_rimPower);
            o.Alpha = pow(rim, _rimPower);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
