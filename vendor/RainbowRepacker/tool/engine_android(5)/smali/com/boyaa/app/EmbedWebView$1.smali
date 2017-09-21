.class Lcom/boyaa/app/EmbedWebView$1;
.super Landroid/webkit/WebView;
.source "EmbedWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/EmbedWebView;->newWebView(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field lastTime:J

.field final synthetic this$0:Lcom/boyaa/app/EmbedWebView;


# direct methods
.method constructor <init>(Lcom/boyaa/app/EmbedWebView;Landroid/content/Context;)V
    .locals 2
    .param p2, "$anonymous0"    # Landroid/content/Context;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/EmbedWebView$1;->this$0:Lcom/boyaa/app/EmbedWebView;

    .line 121
    invoke-direct {p0, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 133
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/boyaa/app/EmbedWebView$1;->lastTime:J

    return-void
.end method


# virtual methods
.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 124
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 125
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget-object v0, v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    if-eqz v0, :cond_0

    .line 126
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget-object v0, v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mGLView:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-virtual {v0, p1, p2}, Lcom/boyaa/engine/made/AppGLSurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 127
    const/4 v0, 0x1

    .line 130
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 138
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_1

    .line 139
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 140
    .local v0, "a":J
    iget-wide v2, p0, Lcom/boyaa/app/EmbedWebView$1;->lastTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1f4

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    .line 141
    const/4 v2, 0x0

    .line 145
    .end local v0    # "a":J
    :goto_0
    return v2

    .line 143
    .restart local v0    # "a":J
    :cond_0
    iput-wide v0, p0, Lcom/boyaa/app/EmbedWebView$1;->lastTime:J

    .line 145
    .end local v0    # "a":J
    :cond_1
    invoke-super {p0, p1}, Landroid/webkit/WebView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    goto :goto_0
.end method
