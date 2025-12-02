if (document.images) {
a_off=new Image();
a_on=new Image();
a_off.src="01.gif";
a_on.src="01_on.gif";

b_off=new Image();
b_on=new Image();
b_off.src="02.gif";
b_on.src="02_on.gif";

c_off=new Image();
c_on=new Image();
c_off.src="03.gif";
c_on.src="03_on.gif";

d_off=new Image();
d_on=new Image();
d_off.src="04.gif";
d_on.src="04_on.gif";

e_off=new Image();
e_on=new Image();
e_off.src="05.gif";
e_on.src="05_on.gif";

f_off=new Image();
f_on=new Image();
f_off.src="06.gif";
f_on.src="06_on.gif";

g_off=new Image();
g_on=new Image();
g_off.src="07.gif";
g_on.src="07_on.gif";

h_off=new Image();
h_on=new Image();
h_off.src="08.gif";
h_on.src="08_on.gif";

i_off=new Image();
i_on=new Image();
i_off.src="09.gif";
i_on.src="09_on.gif";

j_off=new Image();
j_on=new Image();
j_off.src="m_off.gif";
j_on.src="m_selected.gif";

k_off=new Image();
k_on=new Image();
k_off.src="m_off.gif";
k_on.src="m_selected.gif";

l_off=new Image();
l_on=new Image();
l_off.src="m_off.gif";
l_on.src="m_selected.gif";

m_off=new Image();
m_on=new Image();
m_off.src="m_off.gif";
m_on.src="m_selected.gif";

n_off=new Image();
n_on=new Image();
n_off.src="m_off.gif";
n_on.src="m_selected.gif";

o_off=new Image();
o_on=new Image();
o_off.src="m_off.gif";
o_on.src="m_selected.gif";


p_off=new Image();
p_on=new Image();
p_off.src="16.gif";
p_on.src="16_on.gif";


}


function swap(imgName) {

	if (document.images) {
	document.a.src = a_off.src;
	document.b.src = b_off.src;
	document.c.src = c_off.src;
	document.d.src = d_off.src;
	document.e.src = e_off.src;
	document.f.src = f_off.src;
	document.g.src = g_off.src;
	document.h.src = h_off.src;
	document.p.src = p_off.src;
	Img = eval(imgName + "_on.src")
		document [imgName].src = Img;
	}
}
