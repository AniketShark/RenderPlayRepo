Shader "Custom/PropertiesPractice"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _MainTex("Texture",2D) = "white" {}
        _Range("Range", Range(0,1)) = 1
        _Float("Float",Float) = 0.5
        _Vector("Vector",Vector) = (0.5,1,1,1)
      
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
        sampler2D _MainTex;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo =  tex2D(_MainTex,IN.uv_MainTex).rgb * _Color.rgb;
            o.Alpha = _Color.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
