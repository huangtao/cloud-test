.class Lcom/google/protobuf/LiteralByteString;
.super Lcom/google/protobuf/ByteString$LeafByteString;
.source "LiteralByteString.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected final bytes:[B


# direct methods
.method constructor <init>([B)V
    .locals 0
    .param p1, "bytes"    # [B

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/google/protobuf/ByteString$LeafByteString;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    .line 64
    return-void
.end method

.method static hashCode(I[BII)I
    .locals 3
    .param p0, "h"    # I
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 230
    move v0, p2

    .local v0, "i":I
    :goto_0
    add-int v1, p2, p3

    if-ge v0, v1, :cond_0

    .line 231
    mul-int/lit8 v1, p0, 0x1f

    aget-byte v2, p1, v0

    add-int p0, v1, v2

    .line 230
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 233
    :cond_0
    return p0
.end method

.method static hashCode([B)I
    .locals 4
    .param p0, "bytes"    # [B

    .prologue
    .line 237
    array-length v1, p0

    const/4 v2, 0x0

    array-length v3, p0

    invoke-static {v1, p0, v2, v3}, Lcom/google/protobuf/LiteralByteString;->hashCode(I[BII)I

    move-result v0

    .line 238
    .local v0, "h":I
    if-nez v0, :cond_0

    const/4 v0, 0x1

    .end local v0    # "h":I
    :cond_0
    return v0
.end method


# virtual methods
.method public final asReadOnlyByteBuffer()Ljava/nio/ByteBuffer;
    .locals 3

    .prologue
    .line 112
    iget-object v0, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v1

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->size()I

    move-result v2

    invoke-static {v0, v1, v2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public final asReadOnlyByteBufferList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->asReadOnlyByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public byteAt(I)B
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public final copyTo(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "target"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v1

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->size()I

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 108
    return-void
.end method

.method protected copyToInternal([BIII)V
    .locals 1
    .param p1, "target"    # [B
    .param p2, "sourceOffset"    # I
    .param p3, "targetOffset"    # I
    .param p4, "numberToCopy"    # I

    .prologue
    .line 102
    iget-object v0, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    invoke-static {v0, p2, p1, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 103
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 156
    if-ne p1, p0, :cond_0

    move v3, v4

    .line 183
    .end local p1    # "other":Ljava/lang/Object;
    :goto_0
    return v3

    .line 159
    .restart local p1    # "other":Ljava/lang/Object;
    :cond_0
    instance-of v3, p1, Lcom/google/protobuf/ByteString;

    if-nez v3, :cond_1

    move v3, v5

    .line 160
    goto :goto_0

    .line 163
    :cond_1
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->size()I

    move-result v6

    move-object v3, p1

    check-cast v3, Lcom/google/protobuf/ByteString;

    invoke-virtual {v3}, Lcom/google/protobuf/ByteString;->size()I

    move-result v3

    if-eq v6, v3, :cond_2

    move v3, v5

    .line 164
    goto :goto_0

    .line 166
    :cond_2
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->size()I

    move-result v3

    if-nez v3, :cond_3

    move v3, v4

    .line 167
    goto :goto_0

    .line 170
    :cond_3
    instance-of v3, p1, Lcom/google/protobuf/LiteralByteString;

    if-eqz v3, :cond_5

    move-object v0, p1

    .line 171
    check-cast v0, Lcom/google/protobuf/LiteralByteString;

    .line 174
    .local v0, "otherAsLiteral":Lcom/google/protobuf/LiteralByteString;
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->peekCachedHashCode()I

    move-result v2

    .line 175
    .local v2, "thisHash":I
    invoke-virtual {v0}, Lcom/google/protobuf/LiteralByteString;->peekCachedHashCode()I

    move-result v1

    .line 176
    .local v1, "thatHash":I
    if-eqz v2, :cond_4

    if-eqz v1, :cond_4

    if-eq v2, v1, :cond_4

    move v3, v5

    .line 177
    goto :goto_0

    .line 180
    :cond_4
    check-cast p1, Lcom/google/protobuf/LiteralByteString;

    .end local p1    # "other":Ljava/lang/Object;
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->size()I

    move-result v3

    invoke-virtual {p0, p1, v5, v3}, Lcom/google/protobuf/LiteralByteString;->equalsRange(Lcom/google/protobuf/ByteString;II)Z

    move-result v3

    goto :goto_0

    .line 183
    .end local v0    # "otherAsLiteral":Lcom/google/protobuf/LiteralByteString;
    .end local v1    # "thatHash":I
    .end local v2    # "thisHash":I
    .restart local p1    # "other":Ljava/lang/Object;
    :cond_5
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_0
.end method

.method final equalsRange(Lcom/google/protobuf/ByteString;II)Z
    .locals 9
    .param p1, "other"    # Lcom/google/protobuf/ByteString;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/4 v6, 0x0

    .line 198
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->size()I

    move-result v7

    if-le p3, v7, :cond_0

    .line 199
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Length too large: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 201
    :cond_0
    add-int v7, p2, p3

    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->size()I

    move-result v8

    if-le v7, v8, :cond_1

    .line 202
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Ran off end of other: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 203
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 206
    :cond_1
    instance-of v7, p1, Lcom/google/protobuf/LiteralByteString;

    if-eqz v7, :cond_4

    move-object v0, p1

    .line 207
    check-cast v0, Lcom/google/protobuf/LiteralByteString;

    .line 208
    .local v0, "lbsOther":Lcom/google/protobuf/LiteralByteString;
    iget-object v3, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    .line 209
    .local v3, "thisBytes":[B
    iget-object v1, v0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    .line 210
    .local v1, "otherBytes":[B
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v7

    add-int v5, v7, p3

    .line 212
    .local v5, "thisLimit":I
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v4

    .local v4, "thisIndex":I
    invoke-virtual {v0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v7

    add-int v2, v7, p2

    .line 213
    .local v2, "otherIndex":I
    :goto_0
    if-ge v4, v5, :cond_3

    .line 214
    aget-byte v7, v3, v4

    aget-byte v8, v1, v2

    if-eq v7, v8, :cond_2

    .line 221
    .end local v0    # "lbsOther":Lcom/google/protobuf/LiteralByteString;
    .end local v1    # "otherBytes":[B
    .end local v2    # "otherIndex":I
    .end local v3    # "thisBytes":[B
    .end local v4    # "thisIndex":I
    .end local v5    # "thisLimit":I
    :goto_1
    return v6

    .line 213
    .restart local v0    # "lbsOther":Lcom/google/protobuf/LiteralByteString;
    .restart local v1    # "otherBytes":[B
    .restart local v2    # "otherIndex":I
    .restart local v3    # "thisBytes":[B
    .restart local v4    # "thisIndex":I
    .restart local v5    # "thisLimit":I
    :cond_2
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 218
    :cond_3
    const/4 v6, 0x1

    goto :goto_1

    .line 221
    .end local v0    # "lbsOther":Lcom/google/protobuf/LiteralByteString;
    .end local v1    # "otherBytes":[B
    .end local v2    # "otherIndex":I
    .end local v3    # "thisBytes":[B
    .end local v4    # "thisIndex":I
    .end local v5    # "thisLimit":I
    :cond_4
    add-int v7, p2, p3

    invoke-virtual {p1, p2, v7}, Lcom/google/protobuf/ByteString;->substring(II)Lcom/google/protobuf/ByteString;

    move-result-object v7

    invoke-virtual {p0, v6, p3}, Lcom/google/protobuf/LiteralByteString;->substring(II)Lcom/google/protobuf/ByteString;

    move-result-object v6

    invoke-virtual {v7, v6}, Lcom/google/protobuf/ByteString;->equals(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_1
.end method

.method protected getOffsetIntoBytes()I
    .locals 1

    .prologue
    .line 265
    const/4 v0, 0x0

    return v0
.end method

.method public final isValidUtf8()Z
    .locals 3

    .prologue
    .line 141
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v0

    .line 142
    .local v0, "offset":I
    iget-object v1, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->size()I

    move-result v2

    add-int/2addr v2, v0

    invoke-static {v1, v0, v2}, Lcom/google/protobuf/Utf8;->isValidUtf8([BII)Z

    move-result v1

    return v1
.end method

.method public final newCodedInput()Lcom/google/protobuf/CodedInputStream;
    .locals 1

    .prologue
    .line 253
    invoke-static {p0}, Lcom/google/protobuf/CodedInputStream;->newInstance(Lcom/google/protobuf/LiteralByteString;)Lcom/google/protobuf/CodedInputStream;

    move-result-object v0

    return-object v0
.end method

.method public final newInput()Ljava/io/InputStream;
    .locals 4

    .prologue
    .line 246
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->size()I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    return-object v0
.end method

.method protected final partialHash(III)I
    .locals 2
    .param p1, "h"    # I
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 226
    iget-object v0, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v1

    add-int/2addr v1, p2

    invoke-static {p1, v0, v1, p3}, Lcom/google/protobuf/LiteralByteString;->hashCode(I[BII)I

    move-result v0

    return v0
.end method

.method protected final partialIsValidUtf8(III)I
    .locals 3
    .param p1, "state"    # I
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v1

    add-int v0, v1, p2

    .line 148
    .local v0, "index":I
    iget-object v1, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    add-int v2, v0, p3

    invoke-static {p1, v1, v0, v2}, Lcom/google/protobuf/Utf8;->partialIsValidUtf8(I[BII)I

    move-result v1

    return v1
.end method

.method public size()I
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    array-length v0, v0

    return v0
.end method

.method public final substring(II)Lcom/google/protobuf/ByteString;
    .locals 4
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 84
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->size()I

    move-result v1

    invoke-static {p1, p2, v1}, Lcom/google/protobuf/LiteralByteString;->checkRange(III)I

    move-result v0

    .line 86
    .local v0, "length":I
    if-nez v0, :cond_0

    .line 87
    sget-object v1, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    .line 90
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/google/protobuf/BoundedByteString;

    iget-object v2, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v3

    add-int/2addr v3, p1

    invoke-direct {v1, v2, v3, v0}, Lcom/google/protobuf/BoundedByteString;-><init>([BII)V

    goto :goto_0
.end method

.method protected final toStringInternal(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 4
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 133
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->size()I

    move-result v3

    invoke-direct {v0, v1, v2, v3, p1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object v0
.end method

.method public final writeTo(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->toByteArray()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 123
    return-void
.end method

.method final writeToInternal(Ljava/io/OutputStream;II)V
    .locals 2
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "sourceOffset"    # I
    .param p3, "numberToWrite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    iget-object v0, p0, Lcom/google/protobuf/LiteralByteString;->bytes:[B

    invoke-virtual {p0}, Lcom/google/protobuf/LiteralByteString;->getOffsetIntoBytes()I

    move-result v1

    add-int/2addr v1, p2

    invoke-virtual {p1, v0, v1, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 129
    return-void
.end method
