Shader "Custom/Decal"
{
    Properties
    {
        _diffuse("Diffuse",2D) = "white" {}
        _decal("Decal",2D) = "white" {}
        [Toggle] _showDecal("ShowDecal",Float) = 1
    }

    SubShader
    {
        Tags{
            "Queue" = "Geometry"
        }

       /* Pass
        {
            ZWrite On
            ColorMask 0
        }*/

        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_diffuse;
        };

        sampler2D _diffuse;
        sampler2D _decal;
        float _showDecal;

        void surf(Input IN, inout SurfaceOutput o)
        {
            float4 decal = tex2D(_decal , IN.uv_diffuse) * _showDecal;
            float4 diffuse = tex2D(_diffuse, IN.uv_diffuse);
            o.Albedo = decal.r > 0.9 ? decal.rgb : diffuse.rgb;
        }
        ENDCG
    }
        FallBack "Diffuse"
}
