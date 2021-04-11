Shader "Custom/BasicBlinnPhongChallange" 
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
       #pragma surface surf BasicBlinnPhong


       // Custom Lighting function should be prefixed with "Lighting" and appended with function name
       // So, function "BasicBlinnPhong" declared in #pragma becomes "LightingBasicBlinnPhong"
       half4 LightingBasicBlinnPhong(SurfaceOutput s,half3 lightDir,half3 viewDir,half atten)
       {
           half4 c; 
           half3 h = normalize(lightDir + viewDir);

           half diff = max(0, dot(lightDir, s.Normal)); // how much surface albedo color would be added to final pixel color.

           float nh = max(0, dot(s.Normal, h)); // determines how specular highlight falloff between normal and half vector

           float spec = pow(nh, 48.0); // Power of specular highlight

           c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb * spec) * atten * _SinTime.rgb;
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
