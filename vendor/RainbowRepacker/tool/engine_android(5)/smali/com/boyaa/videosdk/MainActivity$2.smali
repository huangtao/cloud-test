.class Lcom/boyaa/videosdk/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/videosdk/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videosdk/MainActivity;


# direct methods
.method constructor <init>(Lcom/boyaa/videosdk/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videosdk/MainActivity$2;->this$0:Lcom/boyaa/videosdk/MainActivity;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 49
    iget-object v1, p0, Lcom/boyaa/videosdk/MainActivity$2;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget-object v1, v1, Lcom/boyaa/videosdk/MainActivity;->edit_uid:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 50
    .local v0, "uid":I
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/boyaa/videodemo/utils/CacheRef;->setUserID(I)V

    .line 51
    iget-object v1, p0, Lcom/boyaa/videosdk/MainActivity$2;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$2;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget-object v2, v2, Lcom/boyaa/videosdk/MainActivity;->roomtype:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/boyaa/videosdk/MainActivity;->roomType:I

    .line 52
    iget-object v1, p0, Lcom/boyaa/videosdk/MainActivity$2;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$2;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget-object v2, v2, Lcom/boyaa/videosdk/MainActivity;->framevalue:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/boyaa/videosdk/MainActivity;->iFrameValue:I

    .line 53
    iget-object v1, p0, Lcom/boyaa/videosdk/MainActivity$2;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$2;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget-object v2, v2, Lcom/boyaa/videosdk/MainActivity;->frametype:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/boyaa/videosdk/MainActivity;->iFarmeType:I

    .line 56
    return-void
.end method
