// Generated by track editor Unity project
const vec3 Xc0 = vec3(0.44,0.13,53.7),Xc1 = vec3(75.5,0,-67.15),Xc2 = vec3(64.74,0,-46.17),Xc3 = vec3(44.37,0,26.66);
const vec4 Xf0 = vec4(0,0,0,1),Xf1 = vec4(0,-0.953,0,0.304),Xf2 = vec4(0,-0.953,0,0.304),Xf3 = vec4(0,-0.729,0,0.684),Xp0 = vec4(63.9,16.3,8.7,50.67);
vec2 Xm( vec3 p )
{
vec2 d = vec2( 10000, 0 );
if( mod( g_traceBits.x / i_BIT6, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.5,0.5,-0.5,0.5,64.4,-0.5,-19.6 ,20.,-20.,-1.57,0.,2. ) );
if( mod( g_traceBits.x / i_BIT7, 2. ) >= 1. )
d = min2( d, sdObj2( p, -0.5,0.5,0.5,0.5,64.46,39.5,0.4 ,20.,-20.,-1.57,0.,2. ) );
if( mod( g_traceBits.x / i_BIT8, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.,-0.707,-0.707,0.,84.4,19.5,20.4 ,20.,-20.,-1.57,0.,2. ) );
if( mod( g_traceBits.x / i_BIT9, 2. ) >= 1. )
d = min2( d, sdObj2( p, -0.5,-0.5,-0.5,0.5,64.4,-0.5,40.4 ,20.,-20.,-1.57,0.,2. ) );
if( mod( g_traceBits.y / i_BIT0, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.,0.,-0.707,0.707,52.3,-0.5,108.83 ,10.,-20.,-1.57,0.,2. ) );
if( mod( g_traceBits.y / i_BIT1, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.,0.,0.,1.,-1.1,5.47,134.5 ,4.,25.,0.,7.,1. ) );
if( mod( g_traceBits.y / i_BIT2, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.,0.,0.,1.,-1.1,7.37,84.34 ,2.,25.,0.,6.,1. ) );
if( mod( g_traceBits.y / i_BIT3, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.,0.,-0.707,0.707,95.5,-0.5,108.83 ,10.,-20.,-1.57,0.,2. ) );
if( mod( g_traceBits.y / i_BIT4, 2. ) >= 1. )
d = min2( d, sdObj3( p, 0.,0.,0.,1.,-1.09,5.47,184.48 ,4.,15.,8.,1. ) );
if( mod( g_traceBits.y / i_BIT5, 2. ) >= 1. )
{
vec2 d1 = opSmoothUnion2(sdObj1( p, 0.,0.,0.,1.,0.5,0.21,-30.12 ,4.,50.,0.,2.,0. ),sdObj0( p, 0.313,0.,0.,0.95,0.5,-2.69,62.28 ,2.29,0.5,5.093 ),2.);
d = min2( d, d1 );
}
return d;
}
float Xt( vec3 ro, vec3 rd, float dist )
{
traceBox( ro, rd, dist, g_traceBits.x, i_BIT6, 0.5,0.5,-0.5,0.5,64.4,-1.,-19.6,21.5,22.,21.5 );
traceBox( ro, rd, dist, g_traceBits.x, i_BIT7, -0.5,0.5,0.5,0.5,64.46,40.,0.4,21.5,22.,21.5 );
traceBox( ro, rd, dist, g_traceBits.x, i_BIT8, 0.,-0.707,-0.707,0.,84.9,19.5,20.4,21.5,22.,21.5 );
traceBox( ro, rd, dist, g_traceBits.x, i_BIT9, -0.5,-0.5,-0.5,0.5,64.4,-1.,40.4,21.5,22.,21.5 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT0, 0.,0.,-0.707,0.707,52.3,4.,108.83,16.5,12.,16.5 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT1, 0.,0.,0.,1.,-1.1,5.47,134.5,5.,1.5,26. );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT2, 0.,0.,0.,1.,-1.1,7.37,84.34,3.,1.5,26. );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT3, 0.,0.,-0.707,0.707,95.5,4.,108.83,16.5,12.,16.5 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT4, 0.,0.,0.,1.,-1.09,5.47,184.48,9.,1.5,16. );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT5, 0.,0.,0.,1.,0.,1.07,-30.16,6.,3.,51. );
return dist < 10000. ? dist : -1.;
}
