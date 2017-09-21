.class Lcom/boyaa/app/web/WebInputDialog$2;
.super Ljava/lang/Object;
.source "WebInputDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/web/WebInputDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/web/WebInputDialog;


# direct methods
.method constructor <init>(Lcom/boyaa/app/web/WebInputDialog;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/web/WebInputDialog$2;->this$0:Lcom/boyaa/app/web/WebInputDialog;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog$2;->this$0:Lcom/boyaa/app/web/WebInputDialog;

    # getter for: Lcom/boyaa/app/web/WebInputDialog;->mEt:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/boyaa/app/web/WebInputDialog;->access$1(Lcom/boyaa/app/web/WebInputDialog;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 66
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog$2;->this$0:Lcom/boyaa/app/web/WebInputDialog;

    # getter for: Lcom/boyaa/app/web/WebInputDialog;->mEt:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/boyaa/app/web/WebInputDialog;->access$1(Lcom/boyaa/app/web/WebInputDialog;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/app/web/WebInputDialog$2;->this$0:Lcom/boyaa/app/web/WebInputDialog;

    # getter for: Lcom/boyaa/app/web/WebInputDialog;->mEt:Landroid/widget/EditText;
    invoke-static {v1}, Lcom/boyaa/app/web/WebInputDialog;->access$1(Lcom/boyaa/app/web/WebInputDialog;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getEditableText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 67
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog$2;->this$0:Lcom/boyaa/app/web/WebInputDialog;

    # invokes: Lcom/boyaa/app/web/WebInputDialog;->openKeyboard()V
    invoke-static {v0}, Lcom/boyaa/app/web/WebInputDialog;->access$2(Lcom/boyaa/app/web/WebInputDialog;)V

    .line 68
    return-void
.end method
