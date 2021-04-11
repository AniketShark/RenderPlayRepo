Shader "Custom/PackedPractice"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
      
    }
    SubShader
    {

        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_MainTex;
        };
        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo.b = _Color.r;
            o.Alpha = _Color.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
