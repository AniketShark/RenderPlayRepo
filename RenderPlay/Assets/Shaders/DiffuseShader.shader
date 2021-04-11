Shader "Custom/Diffuse" 
{
   Properties{
    
       _diffuse("Albedo",2D) = "white" {}
       _intensity("Intensity",Range(0,5)) = 1 
       _myColor("_Color", Color) = (1,1,1,1)
   }

   SubShader
   {
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
