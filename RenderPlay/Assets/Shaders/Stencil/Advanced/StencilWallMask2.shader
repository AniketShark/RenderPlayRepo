Shader "Custom/StencilWallMask2" 
{
   Properties{
    
       _diffuse("Albedo",2D) = "white" {}
   }

   SubShader
   {
       ColorMask 0
       ZWrite Off
       Stencil
       {
           Ref 1
           Comp always
           Pass replace
       }

       CGPROGRAM
       #pragma surface surf Lambert

       struct Input {
           float2 uv_diffuse; // uv+textureproperty name uv + _diffuse = uv_diffuse
           float3 worldRefl;  // world reflection vector
       };

       fixed4 _myColor;
       sampler2D _diffuse;
       float _intensity;

       void surf(Input IN,inout SurfaceOutput o){ 
           o.Albedo = tex2D(_diffuse, IN.uv_diffuse).rgb;
       }
       ENDCG
   }
    FallBack "Diffuse"
}
