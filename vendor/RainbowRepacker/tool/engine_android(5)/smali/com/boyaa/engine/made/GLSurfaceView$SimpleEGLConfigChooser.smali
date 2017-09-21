.class Lcom/boyaa/engine/made/GLSurfaceView$SimpleEGLConfigChooser;
.super Lcom/boyaa/engine/made/GLSurfaceView$ComponentSizeChooser;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/made/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SimpleEGLConfigChooser"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/GLSurfaceView;


# direct methods
.method public constructor <init>(Lcom/boyaa/engine/made/GLSurfaceView;Z)V
    .locals 8
    .param p2, "withDepthBuffer"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v5, 0x0

    .line 977
    iput-object p1, p0, Lcom/boyaa/engine/made/GLSurfaceView$SimpleEGLConfigChooser;->this$0:Lcom/boyaa/engine/made/GLSurfaceView;

    .line 978
    if-eqz p2, :cond_0

    const/16 v6, 0x10

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move v3, v2

    move v4, v2

    move v7, v5

    invoke-direct/range {v0 .. v7}, Lcom/boyaa/engine/made/GLSurfaceView$ComponentSizeChooser;-><init>(Lcom/boyaa/engine/made/GLSurfaceView;IIIIII)V

    .line 979
    return-void

    :cond_0
    move v6, v5

    .line 978
    goto :goto_0
.end method
