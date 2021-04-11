Shader "Custom/StencilWallMask1" 
{
    Properties{

        _Color("Main Color",Color) = (1,1,1,1)

        _SRef("Stencil Ref",Float) = 1
        [Enum(UnityEngine.Rendering.CompareFunction)] _SComp("Stencil Comparison",Float) = 8
        [Enum(UnityEngine.Rendering.StencilOp)] _SOp ("Stencil Operation",Float) = 2
   }

   SubShader
   {
       Tags{"Queue" = "Geometry-1"}
       ColorMask 0
       ZWrite Off
       Stencil
       {
           Ref [_SRef]
           Comp [_SComp]
           Pass[_SOp]
       }

       CGPROGRAM
       #pragma surface surf Lambert

       struct Input {
           float2 uv_diffuse; // uv+textureproperty name uv + _diffuse = uv_diffuse
       };

       float4 _Color;

       void surf(Input IN,inout SurfaceOutput o){ 
           o.Albedo = _Color.rgb;
       }
       ENDCG
   }
    FallBack "Diffuse"
}
