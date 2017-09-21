.class Lcom/boyaa/app/web/WebInputDialog$1;
.super Ljava/lang/Object;
.source "WebInputDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    iput-object p1, p0, Lcom/boyaa/app/web/WebInputDialog$1;->this$0:Lcom/boyaa/app/web/WebInputDialog;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog$1;->this$0:Lcom/boyaa/app/web/WebInputDialog;

    # getter for: Lcom/boyaa/app/web/WebInputDialog;->wdcb:Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;
    invoke-static {v0}, Lcom/boyaa/app/web/WebInputDialog;->access$0(Lcom/boyaa/app/web/WebInputDialog;)Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog$1;->this$0:Lcom/boyaa/app/web/WebInputDialog;

    # getter for: Lcom/boyaa/app/web/WebInputDialog;->wdcb:Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;
    invoke-static {v0}, Lcom/boyaa/app/web/WebInputDialog;->access$0(Lcom/boyaa/app/web/WebInputDialog;)Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/app/web/WebInputDialog$1;->this$0:Lcom/boyaa/app/web/WebInputDialog;

    # getter for: Lcom/boyaa/app/web/WebInputDialog;->mEt:Landroid/widget/EditText;
    invoke-static {v1}, Lcom/boyaa/app/web/WebInputDialog;->access$1(Lcom/boyaa/app/web/WebInputDialog;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;->onCallBack(Ljava/lang/String;)V

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/boyaa/app/web/WebInputDialog$1;->this$0:Lcom/boyaa/app/web/WebInputDialog;

    invoke-virtual {v0}, Lcom/boyaa/app/web/WebInputDialog;->dismiss()V

    .line 58
    return-void
.end method
