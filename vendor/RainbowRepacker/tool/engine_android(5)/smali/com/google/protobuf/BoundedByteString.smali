.class final Lcom/google/protobuf/BoundedByteString;
.super Lcom/google/protobuf/LiteralByteString;
.source "BoundedByteString.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final bytesLength:I

.field private final bytesOffset:I


# direct methods
.method constructor <init>([BII)V
    .locals 2
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lcom/google/protobuf/LiteralByteString;-><init>([B)V

    .line 67
    add-int v0, p2, p3

    array-length v1, p1

    invoke-static {p2, v0, v1}, Lcom/google/protobuf/BoundedByteString;->checkRange(III)I

    .line 69
    iput p2, p0, Lcom/google/protobuf/BoundedByteString;->bytesOffset:I

    .line 70
    iput p3, p0, Lcom/google/protobuf/BoundedByteString;->bytesLength:I

    .line 71
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 2
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    new-instance v0, Ljava/io/InvalidObjectException;

    const-string v1, "BoundedByteStream instances are not to be serialized directly"

    invoke-direct {v0, v1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public byteAt(I)B
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 87
    invoke-virtual {p0}, Lcom/google/protobuf/BoundedByteString;->size()I

    move-result v0

    invoke-static {p1, v0}, Lcom/google/protobuf/BoundedByteString;->checkIndex(II)V

    .line 88
    iget-object v0, p0, Lcom/google/protobuf/BoundedByteString;->bytes:[B

    iget v1, p0, Lcom/google/protobuf/BoundedByteString;->bytesOffset:I

    add-int/2addr v1, p1

    aget-byte v0, v0, v1

    return v0
.end method

.method protected copyToInternal([BIII)V
    .locals 2
    .param p1, "target"    # [B
    .param p2, "sourceOffset"    # I
    .param p3, "targetOffset"    # I
    .param p4, "numberToCopy"    # I

    .prologue
    .line 107
    iget-object v0, p0, Lcom/google/protobuf/BoundedByteString;->bytes:[B

    invoke-virtual {p0}, Lcom/google/protobuf/BoundedByteString;->getOffsetIntoBytes()I

    move-result v1

    add-int/2addr v1, p2

    invoke-static {v0, v1, p1, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 109
    return-void
.end method

.method protected getOffsetIntoBytes()I
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/google/protobuf/BoundedByteString;->bytesOffset:I

    return v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 93
    iget v0, p0, Lcom/google/protobuf/BoundedByteString;->bytesLength:I

    return v0
.end method

.method writeReplace()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 117
    new-instance v0, Lcom/google/protobuf/LiteralByteString;

    invoke-virtual {p0}, Lcom/google/protobuf/BoundedByteString;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/protobuf/LiteralByteString;-><init>([B)V

    return-object v0
.end method
