import subprocess
from tkinter import *
from tkinter.ttk import *
from tkinter import messagebox
from tkinter import ttk

# root= tk.Tk()
window = Tk()
window.title("Atualização SAR")
window.geometry('600x600')

selected = StringVar()

lbl = Label(window, text="")
lbl.grid(column=1, row=2, columnspan=4, sticky=W)

rad1 = Radiobutton(window, text='tjerj230avm', value="tjerj230avm", variable=selected)
rad2 = Radiobutton(window, text='tjerj230bvm', value="tjerj230bvm", variable=selected)
rad3 = Radiobutton(window, text='tjerj230cvm', value="tjerj230cvm", variable=selected)


def clicked():
    # print(selected.get())
    # res = "Servidor " + txt.get()
    lbl.configure(text="Servidor selecionado: " + selected.get())
    ttk.Separator(window, orient=HORIZONTAL).grid(row=5, columnspan=5, sticky=EW)
    messagebox.showinfo('Título', 'Servidor selecionado: ' + selected.get())


btn = Button(window, text="Select Server", command=clicked)
rad1.grid(column=1, row=0)
rad2.grid(column=2, row=0)
rad3.grid(column=3, row=0)
btn.grid(column=4, row=0)


def start_batch():
    subprocess.call([r'.\teste.bat'])


window.mainloop()
