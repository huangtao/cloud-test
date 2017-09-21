.class Lcom/boyaa/engine/made/AppEditBoxView$1;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/made/AppEditBoxView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppEditBoxView;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppEditBoxView;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$1;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 7
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 74
    const-string v5, "Edit"

    iget-object v6, p0, Lcom/boyaa/engine/made/AppEditBoxView$1;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mText:Ljava/lang/String;
    invoke-static {v6}, Lcom/boyaa/engine/made/AppEditBoxView;->access$000(Lcom/boyaa/engine/made/AppEditBoxView;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    const/4 v4, 0x0

    .line 76
    .local v4, "old_i":I
    const/4 v3, 0x0

    .line 77
    .local v3, "new_i":I
    :goto_0
    iget-object v5, p0, Lcom/boyaa/engine/made/AppEditBoxView$1;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mText:Ljava/lang/String;
    invoke-static {v5}, Lcom/boyaa/engine/made/AppEditBoxView;->access$000(Lcom/boyaa/engine/made/AppEditBoxView;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_0

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 78
    iget-object v5, p0, Lcom/boyaa/engine/made/AppEditBoxView$1;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mText:Ljava/lang/String;
    invoke-static {v5}, Lcom/boyaa/engine/made/AppEditBoxView;->access$000(Lcom/boyaa/engine/made/AppEditBoxView;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-interface {p1, v3}, Landroid/text/Editable;->charAt(I)C

    move-result v6

    if-eq v5, v6, :cond_2

    .line 85
    :cond_0
    iget-object v5, p0, Lcom/boyaa/engine/made/AppEditBoxView$1;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mText:Ljava/lang/String;
    invoke-static {v5}, Lcom/boyaa/engine/made/AppEditBoxView;->access$000(Lcom/boyaa/engine/made/AppEditBoxView;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    sub-int v1, v5, v4

    .line 86
    .local v1, "nDelete":I
    iget-object v5, p0, Lcom/boyaa/engine/made/AppEditBoxView$1;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;
    invoke-static {v5}, Lcom/boyaa/engine/made/AppEditBoxView;->access$100(Lcom/boyaa/engine/made/AppEditBoxView;)Lcom/boyaa/engine/made/AppActivity;

    move-result-object v5

    new-instance v6, Lcom/boyaa/engine/made/AppEditBoxView$1$1;

    invoke-direct {v6, p0, v1}, Lcom/boyaa/engine/made/AppEditBoxView$1$1;-><init>(Lcom/boyaa/engine/made/AppEditBoxView$1;I)V

    invoke-virtual {v5, v6}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 93
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v5

    sub-int v2, v5, v3

    .line 94
    .local v2, "nModified":I
    if-lez v2, :cond_1

    .line 95
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v5

    invoke-interface {p1, v3, v5}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, "insertText":Ljava/lang/String;
    iget-object v5, p0, Lcom/boyaa/engine/made/AppEditBoxView$1;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mActivity:Lcom/boyaa/engine/made/AppActivity;
    invoke-static {v5}, Lcom/boyaa/engine/made/AppEditBoxView;->access$100(Lcom/boyaa/engine/made/AppEditBoxView;)Lcom/boyaa/engine/made/AppActivity;

    move-result-object v5

    new-instance v6, Lcom/boyaa/engine/made/AppEditBoxView$1$2;

    invoke-direct {v6, p0, v0}, Lcom/boyaa/engine/made/AppEditBoxView$1$2;-><init>(Lcom/boyaa/engine/made/AppEditBoxView$1;Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 104
    .end local v0    # "insertText":Ljava/lang/String;
    :cond_1
    iget-object v5, p0, Lcom/boyaa/engine/made/AppEditBoxView$1;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    # setter for: Lcom/boyaa/engine/made/AppEditBoxView;->mText:Ljava/lang/String;
    invoke-static {v5, v6}, Lcom/boyaa/engine/made/AppEditBoxView;->access$002(Lcom/boyaa/engine/made/AppEditBoxView;Ljava/lang/String;)Ljava/lang/String;

    .line 105
    return-void

    .line 81
    .end local v1    # "nDelete":I
    .end local v2    # "nModified":I
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 82
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "n1"    # I
    .param p3, "n2"    # I
    .param p4, "n3"    # I

    .prologue
    .line 70
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$1;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    # setter for: Lcom/boyaa/engine/made/AppEditBoxView;->mText:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/boyaa/engine/made/AppEditBoxView;->access$002(Lcom/boyaa/engine/made/AppEditBoxView;Ljava/lang/String;)Ljava/lang/String;

    .line 71
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "n1"    # I
    .param p3, "n2"    # I
    .param p4, "n3"    # I

    .prologue
    .line 67
    return-void
.end method
