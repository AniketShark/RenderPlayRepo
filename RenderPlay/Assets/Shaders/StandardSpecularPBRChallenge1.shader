Shader "Custom/StandardSpecularPBRChallenge1"
{
    Properties
    {
        _color("Color",Color) = (1,1,1,1)
        _SpecColor("Specular",Color) = (1,1,1,1)
        _metallicMap("Metallic (R)",2D) = "white" {}
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
        }
        CGPROGRAM
        #pragma surface surf StandardSpecular

        struct Input
        {
            //float2 uv_diffuse;
            float2 uv_metallicMap;
        };
        
        fixed4 _color;
        sampler2D _metallicMap;

        void surf (Input IN, inout SurfaceOutputStandardSpecular o)
        {
            o.Albedo = _color.rgb;
            o.Smoothness = 0.9 - tex2D(_metallicMap, IN.uv_metallicMap).r;
            o.Specular = tex2D(_metallicMap, IN.uv_metallicMap).r *_SpecColor.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
