.class Lcom/boyaa/engine/made/AppGLSurfaceView$5;
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

.field final synthetic val$x:F

.field final synthetic val$y:F


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppGLSurfaceView;FFJ)V
    .locals 0

    .prologue
    .line 170
    iput-object p1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$5;->this$0:Lcom/boyaa/engine/made/AppGLSurfaceView;

    iput p2, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$5;->val$x:F

    iput p3, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$5;->val$y:F

    iput-wide p4, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$5;->val$time:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 173
    iget v0, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$5;->val$x:F

    iget v1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$5;->val$y:F

    iget-wide v2, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$5;->val$time:J

    invoke-static {v0, v1, v2, v3}, Lcom/boyaa/engine/made/GhostLib;->onTouchUp(FFJ)V

    .line 174
    return-void
.end method
