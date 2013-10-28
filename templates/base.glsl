#version 330

#ifdef vertexcompile
<%block name="vertexshader"/>
#endif

#ifdef fragmentcompile 
<%block name="fragmentshader"/>
#endif
