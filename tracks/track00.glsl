// Generated by track editor Unity project
const vec3 Xc0 = vec3(0,-10,0),Xc1 = vec3(0,-10,0),Xc2 = vec3(0,-10,0),Xc3 = vec3(0,-10,0);
const vec4 Xf0 = vec4(0,0,0,1),Xf1 = vec4(0,0,0,1),Xf2 = vec4(0,0,0,1),Xf3 = vec4(0,0,0,1),Xp0 = vec4(0,0,0,0);
vec2 Xm( vec3 p )
{
vec2 d = vec2( 10000, 0 );
if( mod( g_traceBits.y / i_BIT0, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.,0.,-0.707,0.707,0.5,5.65,128.61 ,4.,-20.,-1.57,1. ) );
if( mod( g_traceBits.y / i_BIT1, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.,0.,0.,1.,0.5,5.65,87.7 ,4.,20.505,0.,2.,1. ) );
if( mod( g_traceBits.y / i_BIT2, 2. ) >= 1. )
d = min2( d, sdObj0( p, -0.178,-0.507,-0.71,0.455,-67.8,-9.6,65.9 ,18.917,18.917,18.917 ) );
if( mod( g_traceBits.y / i_BIT3, 2. ) >= 1. )
{
vec2 d1 = opSmoothUnion2(sdObj1( p, 0.,0.,0.,1.,0.5,0.,-130.66 ,4.,100.,0.,2.,1. ),sdObj0( p, 0.383,0.,0.,0.924,0.5,-1.42,64.2 ,2.29,0.5,3.109 ),2.);
d = min2( d, d1 );
}
return d;
}
float Xt( vec3 ro, vec3 rd, float dist )
{
traceBox( ro, rd, dist, g_traceBits.y, i_BIT0, 0.,0.,-0.707,0.707,0.5,13.15,128.61,13.5,6.,13.5 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT1, 0.,0.,0.,1.,0.5,5.65,87.7,5.,1.5,21.505 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT2, -0.178,-0.507,-0.71,0.455,-67.8,-9.6,65.9,18.917,18.917,18.917 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT3, 0.,0.,0.,1.,0.,0.,-130.8,7.5,5.,102.5 );
return dist < 10000. ? dist : -1.;
}
