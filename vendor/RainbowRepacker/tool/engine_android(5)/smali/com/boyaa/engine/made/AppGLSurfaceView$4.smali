.class Lcom/boyaa/engine/made/AppGLSurfaceView$4;
.super Ljava/lang/Object;
.source "AppGLSurfaceView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppGLSurfaceView;->onTouchEvent(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppGLSurfaceView;

.field final synthetic val$time:J

.field final synthetic val$velocityX:F

.field final synthetic val$velocityY:F

.field final synthetic val$x:F

.field final synthetic val$y:F


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppGLSurfaceView;FFJFF)V
    .locals 0

    .prologue
    .line 162
    iput-object p1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->this$0:Lcom/boyaa/engine/made/AppGLSurfaceView;

    iput p2, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->val$x:F

    iput p3, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->val$y:F

    iput-wide p4, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->val$time:J

    iput p6, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->val$velocityX:F

    iput p7, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->val$velocityY:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 165
    iget v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->val$x:F

    iget v1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->val$y:F

    iget-wide v2, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->val$time:J

    iget v4, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->val$velocityX:F

    iget v5, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$4;->val$velocityY:F

    invoke-static/range {v0 .. v5}, Lcom/boyaa/engine/made/GhostLib;->onTouchMove(FFJFF)V

    .line 166
    return-void
.end method
