Shader "Custom/StandardPBRChallenge1"
{
    Properties
    {
        _color("Color",Color) = (1,1,1,1)
        _metallicMap("Metallic (R)",2D) = "white" {}
        _metallic("Metallic",Range(0,1)) = 0.5 
        _emission("Emission",Range(0,10)) = 1
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard

        struct Input
        {
            float2 uv_metallicMap;
        };
        
        fixed4 _color;
        sampler2D _metallicMap;
        fixed _metallic;
        float _emission;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _color.rgb;
            o.Smoothness = tex2D(_metallicMap, IN.uv_metallicMap).r;
            o.Metallic = _metallic;
            o.Emission = o.Smoothness * _emission;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
