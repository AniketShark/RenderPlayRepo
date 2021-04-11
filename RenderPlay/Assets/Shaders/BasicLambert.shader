Shader "Custom/BasicLambert" 
{
   Properties{
       _color("_Color", Color) = (1,1,1,1)
   }

   SubShader
   {
       Tags {
           "Queue" = "Geometry"
        }
       CGPROGRAM
       #pragma surface surf BasicLambert


       // Custom Lighting function should be prefixed with "Lighting" and appended with function name
       // So, function "BasicLambert" declared in #pragma becomes "LightingBasicLambert"
       half4 LightingBasicLambert(SurfaceOutput s,half3 lightDir,half atten)
       {
           half4 c;
           half NdotL = dot(lightDir, s.Normal);
           //half NdotL = dot(s.Normal, lightDir);
           //finalColor = SurfaceColor * (Normal dot LightDir) * (Surface Attenuation) * (Combined Color of all Lights Affecting Pixel)
           c.rgb = s.Albedo * NdotL * atten * _LightColor0.rgb;
           c.a = s.Alpha;
           return c;
       }

       struct Input {
           float2 uv_MainTex;
       };

       float4 _color;

       void surf(Input IN,inout SurfaceOutput o){ 
           o.Albedo = _color.rgb;
       }
       ENDCG
   }
    FallBack "Diffuse"
}
