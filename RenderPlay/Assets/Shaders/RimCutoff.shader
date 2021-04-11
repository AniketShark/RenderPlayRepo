Shader "Custom/RimCutoff"
{
    Properties
    {
        _diffuse("Diffuse",2D) = "white" {}
        _rimColor("Rim Color",Color) = (1,1,1,1)
        _rimPower("Rim Power",Range(0.5,8)) = 1
        _stripeWidth("Stripe Width",Range(0.2,1)) = 0.5
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_diffuse;
            float3 viewDir;
            float3 worldPos;
        };
        
        float4 _rimColor;
        float _rimPower;
        sampler2D _diffuse;
        float _stripeWidth;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_diffuse, IN.uv_diffuse).rgb;
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            //o.Emission = _rimColor * pow(rim, _rimPower);
            //o.Emission = rim > 0.5 ? float3(1, 0, 0) : rim > 0.3 ? float3(0, 1, 0) : rim;
            o.Emission = frac(IN.worldPos.y * 10 * _stripeWidth) > (_stripeWidth-0.1) ? float3(1, 0, 0) * rim : float3(0, 1, 0) * rim;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
