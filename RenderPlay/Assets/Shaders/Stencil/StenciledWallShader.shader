Shader "Custom/StenciledWallShader" 
{
   Properties{
    
       _diffuse("Albedo",2D) = "white" {}
       _normal("Normal",2D) = "bump" {}
       _bumpSlider("Bump Slider", Range(0,5)) = 1
       _bumpBrightness("Brightness",Range(0,5)) = 1
   }

   SubShader
   {
       Stencil
       {
           Ref 1
           Comp notequal
           Pass Keep
       }
       CGPROGRAM
       #pragma surface surf Lambert

       struct Input {
           float2 uv_diffuse; // uv+textureproperty name uv + _diffuse = uv_diffuse
           float2 uv_normal;  // uv+textureproperty name uv + _diffuse = uv_diffuse
       };

       sampler2D _diffuse;
       sampler2D _normal;
       half _bumpSlider;
       half _bumpBrightness;

       void surf(Input IN,inout SurfaceOutput o){ 
           o.Albedo = tex2D(_diffuse, IN.uv_diffuse).rgb;
           o.Normal = UnpackNormal(tex2D(_normal, IN.uv_normal)) * _bumpBrightness;
           o.Normal *= float3(_bumpSlider, _bumpSlider, 1);
       }
       ENDCG
   }
    FallBack "Diffuse"
}
