Shader "Custom/BumpDiffuseStencil" 
{
   Properties{
    
       _diffuse("Albedo",2D) = "white" {}
       _normal("Normal",2D) = "bump" {}
       _bumpSlider("Bump Slider", Range(0,5)) = 1

        _SRef("Stencil Ref",Float) = 1
        [Enum(UnityEngine.Rendering.CompareFunction)] _SComp("Stencil Comparison",Float) = 8
        [Enum(UnityEngine.Rendering.StencilOp)] _SOp("Stencil Operation",Float) = 2

   }

   SubShader
   {
       Stencil
       {
           Ref[_SRef]
           Comp[_SComp]
           Pass[_SOp]
       }

       CGPROGRAM
       #pragma surface surf Lambert

       struct Input {
           float2 uv_diffuse; // uv+textureproperty name uv + _diffuse = uv_diffuse
           float2 uv_normal;  // uv+textureproperty name uv + _diffuse = uv_diffuse
       };

       sampler2D _diffuse;
       sampler2D _normal;
       half _bumpSlider;

       void surf(Input IN,inout SurfaceOutput o){ 
           o.Albedo = tex2D(_diffuse, IN.uv_diffuse).rgb;
           o.Normal = UnpackNormal(tex2D(_normal, IN.uv_normal));
           o.Normal *= float3(_bumpSlider, _bumpSlider, 1);
       }
       ENDCG
   }
    FallBack "Diffuse"
}
