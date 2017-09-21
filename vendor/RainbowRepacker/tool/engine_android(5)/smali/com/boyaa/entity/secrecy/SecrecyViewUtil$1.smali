.class Lcom/boyaa/entity/secrecy/SecrecyViewUtil$1;
.super Landroid/webkit/WebView;
.source "SecrecyViewUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/secrecy/SecrecyViewUtil;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/secrecy/SecrecyViewUtil;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/secrecy/SecrecyViewUtil;Landroid/content/Context;)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/secrecy/SecrecyViewUtil$1;->this$0:Lcom/boyaa/entity/secrecy/SecrecyViewUtil;

    .line 84
    invoke-direct {p0, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 87
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 88
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget-object v0, v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    if-eqz v0, :cond_0

    .line 89
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget-object v0, v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {v0, p1, p2}, Lcom/boyaa/engine/made/AppGLSurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 90
    const/4 v0, 0x1

    .line 93
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
