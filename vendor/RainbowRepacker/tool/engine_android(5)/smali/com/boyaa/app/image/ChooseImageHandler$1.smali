.class Lcom/boyaa/app/image/ChooseImageHandler$1;
.super Ljava/lang/Object;
.source "ChooseImageHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/image/ChooseImageHandler;->showChooseDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/image/ChooseImageHandler;


# direct methods
.method constructor <init>(Lcom/boyaa/app/image/ChooseImageHandler;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/image/ChooseImageHandler$1;->this$0:Lcom/boyaa/app/image/ChooseImageHandler;

    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 195
    packed-switch p2, :pswitch_data_0

    .line 203
    :goto_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 204
    return-void

    .line 197
    :pswitch_0
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler$1;->this$0:Lcom/boyaa/app/image/ChooseImageHandler;

    invoke-virtual {v0}, Lcom/boyaa/app/image/ChooseImageHandler;->doTakePhoto()V

    goto :goto_0

    .line 200
    :pswitch_1
    iget-object v0, p0, Lcom/boyaa/app/image/ChooseImageHandler$1;->this$0:Lcom/boyaa/app/image/ChooseImageHandler;

    # invokes: Lcom/boyaa/app/image/ChooseImageHandler;->doPickPhotoFromGallery()V
    invoke-static {v0}, Lcom/boyaa/app/image/ChooseImageHandler;->access$0(Lcom/boyaa/app/image/ChooseImageHandler;)V

    goto :goto_0

    .line 195
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
