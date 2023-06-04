local setup, comment = pcall(require, "Comment")

if not setup then
    print("comment not setup")
    return
end

comment.setup()
