float2 track( float3 p )
{
return min2(opSmoothUnion2(sdObj0( mul(quat(0.313,0,0,0.95),p-float3(0.5,-2.73,11.44)), float3(2.29,0.5,5.093)),sdObj1( mul(quat(0,0,0,1),p-float3(0.5,0.17,-3.68)), float3(4,0.5,11.047),0.),2),min2(sdObj1( mul(quat(0,0,0,1),p-float3(0.5,0.17,-3.68)), float3(4,0.5,11.047),0.),min2(sdObj1( mul(quat(0,0.707,0,0.707),p-float3(80.5,8.2,117.41)), float3(4,0.5,20),-80.),min2(sdObj0( mul(quat(0.313,0,0,0.95),p-float3(0.5,-2.73,11.44)), float3(2.29,0.5,5.093)),min2(sdObj2( mul(quat(0,0,0,1),p-float3(0.5,8.2,77.42)), float3(4,0.5,20),-40.,-0.5),sdObj1( mul(quat(0,0,0,1),p-float3(0.5,8.2,37.45)), float3(4,0.5,20),80.))))));
}