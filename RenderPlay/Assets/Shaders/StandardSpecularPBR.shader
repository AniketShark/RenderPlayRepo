Shader "Custom/StandardSpecularPBR"
{
    Properties
    {
        _color("Color",Color) = (1,1,1,1)
        _SpecColor("Specular",Color) = (1,1,1,1)
        _metallicMap("Metallic (R)",2D) = "white" {}
        _emission("Emission",Range(0,1)) = 1
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf StandardSpecular

        struct Input
        {
            //float2 uv_diffuse;
            float2 uv_metallicMap;
        };
        
        fixed4 _color;
        sampler2D _metallicMap;
        fixed _metallic;
        float _emission;

        void surf (Input IN, inout SurfaceOutputStandardSpecular o)
        {
            o.Albedo = _color;
            o.Smoothness = tex2D(_metallicMap, IN.uv_metallicMap).r;
            o.Specular = _SpecColor.rgb;
            o.Emission = float3(_emission, _emission, _emission);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
