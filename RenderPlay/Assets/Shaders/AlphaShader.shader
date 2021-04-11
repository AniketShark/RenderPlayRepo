Shader "Custom/AlphaShader" 
{
   Properties{
    
       _diffuse("Albedo",2D) = "white" {}
   }

   SubShader
   {
       Tags {
           "Queue" = "Transparent"
       }
       CGPROGRAM
       #pragma surface surf Lambert alpha:fade

       struct Input {
           float2 uv_diffuse; // uv+textureproperty name uv + _diffuse = uv_diffuse
           float3 worldRefl;  // world reflection vector
       };

       fixed4 _myColor;
       sampler2D _diffuse;
       float _intensity;

       void surf(Input IN,inout SurfaceOutput o){ 
           fixed4 c = tex2D(_diffuse, IN.uv_diffuse);

           o.Albedo = c.rgb;
           o.Alpha = c.a;
       }
       ENDCG
   }
    FallBack "Diffuse"
}
