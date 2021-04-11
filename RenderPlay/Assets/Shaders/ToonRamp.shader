Shader "Custom/ToonRamp" 
{
   Properties{
       _rampTex("Ramp",2D) = "white" {}
       _diffuse("Diffuse",2D) = "white" {}
       _color("_Color", Color) = (1,1,1,1)
   }

   SubShader
   {
       Tags {
           "Queue" = "Geometry"
        }
       CGPROGRAM
       #pragma surface surf ToonRamp
       struct Input {
           float2 uv_rampTex;
           float2 uv_diffuse;
           float3 viewDir;
       };

       float4 _color;
       sampler2D _rampTex;
       sampler2D _diffuse;

       half4 LightingToonRamp(SurfaceOutput s,half3 lightDir,half3 viewDir,half atten)
       {
           half4 c; 
           half diff = dot(lightDir, s.Normal);
           half h = diff * 0.5 + 0.5;
           float ramp = tex2D(_rampTex, h).r;
           c.rgb = s.Albedo * _LightColor0.rgb * ramp;
           c.a   = s.Alpha;
           return c;
       }

      
       void surf(Input IN,inout SurfaceOutput o){ 

           //half diff = dot(IN.viewDir, o.Normal);
           //half h = diff * 0.5 + 0.5;
           o.Albedo = tex2D(_diffuse, IN.uv_diffuse).rgb;
       }
       ENDCG
   }
    FallBack "Diffuse"
}
