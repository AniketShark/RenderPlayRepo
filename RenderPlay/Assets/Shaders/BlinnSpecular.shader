Shader "Custom/BlinnSpecular"
{
    Properties
    {
        _diffuse("Diffuse",2D) = "white" {}
        _specularMap("Specular Map",2D) = "white" {}
        _SpecColor("Spec Color",Color) = (1,1,1,1)
        _specular("Specular",Range(0,1)) = 0.5
        _gloss("Gloss",Range(0,1)) = 0.5 
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf BlinnPhong

        struct Input
        {
            float2 uv_diffuse;
            float2 uv_specularMap;
        };
        
        sampler2D _diffuse;
        sampler2D _specularMap;
        half _specular;
        fixed _gloss;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_diffuse, IN.uv_diffuse).rgb;
            o.Specular = tex2D(_specularMap, IN.uv_specularMap).r;
            //o.Specular = _specular;
            o.Gloss = _gloss;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
