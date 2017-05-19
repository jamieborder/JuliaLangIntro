files = ["tutorial.docx", "lecture.docx", "assignment.docx"]

for (i, f) in enumerate(files)
    println("the index is    = ", i)
    println("the filename is = ", f)
    println("the basename is = ", f[1:end-5])
    println("new file        = ", f[1:end-5] * "$i.docx")
    println()
end
