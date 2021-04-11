Shader "Custom/BlendShader" 
{
   Properties{
    
       _diffuse("Albedo",2D) = "white" {}
   }

   SubShader
   {
       Tags {
           "Queue" = "Transparent"
       }
       //Blend SrcAlpha OneMinusSrcAlpha
       //Blend One One // Additive
       Blend DstColor Zero // Multiplicative
       Pass
       {
            SetTexture[_diffuse] {combine texture}
       }
   }
    FallBack "Diffuse"
}
