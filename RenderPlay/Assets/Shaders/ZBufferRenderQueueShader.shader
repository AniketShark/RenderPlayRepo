Shader "Custom/ZBufferRenderQueueShader"
{
    Properties
    {
        _diffuse("Diffuse",2D) = "white" {}
    }
    SubShader
    {
        Tags {"Queue" = "Geometry+100"}
        ZWrite Off

        CGPROGRAM
        #pragma surface surf Lambert
        
        struct Input
        {
            float2 uv_diffuse;
        };

        sampler2D _diffuse;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_diffuse,IN.uv_diffuse);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
