Shader "Custom/MetalicReflectiveBumpedShader" 
{
   Properties{
    
       _diffuse("Albedo",2D) = "white" {}
       _normal("Normal",2D) = "bump" {}
       _cubeMap("Cube",CUBE) = "white" {}
       _bumpSlider("Bump Slider", Range(0,5)) = 1
       _bumpBright("Brightness", Range(0,10)) = 1
   }

   SubShader
   {
       CGPROGRAM
       #pragma surface surf Lambert

       struct Input {
           float2 uv_diffuse;
           float2 uv_normal;
           float3 worldRefl; INTERNAL_DATA
       };

       sampler2D _diffuse;
       sampler2D _normal;
       samplerCUBE _cubeMap;
       half _bumpSlider;
       half _bumpBright;

       void surf(Input IN,inout SurfaceOutput o) { 
           o.Normal = UnpackNormal(tex2D(_normal, IN.uv_normal)) * 0.3;
           o.Albedo = texCUBE(_cubeMap, WorldReflectionVector(IN, o.Normal)).rgb;
       }
       ENDCG
   }
    FallBack "Diffuse"
}
